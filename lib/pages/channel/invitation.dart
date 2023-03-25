import 'dart:async';
import 'package:asyou_app/router.dart';
import 'package:flutter/material.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';

import '../../../utils/matrix_sdk_extensions/matrix_locals.dart';
import '../../../utils/localized_extension.dart';
import '../../components/app_bar.dart';
import '../../components/avatar.dart';
import '../../components/model_bar.dart';
import '../../store/im.dart';
import '../../store/theme.dart';

class InvitationPage extends StatefulWidget {
  final String id;
  final Function? closeModel;
  const InvitationPage({Key? key, required this.id, this.closeModel}) : super(key: key);

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  late String currentSearchTerm;
  late Client client;
  bool loading = false;
  List<Profile> foundProfiles = [];
  Timer? coolDown;

  String? get roomId => widget.id;

  @override
  void initState() {
    super.initState();

    var im = context.read<IMProvider>();
    client = im.currentState!.client;
  }

  Future<List<User>> getContacts(BuildContext context) async {
    final room = client.getRoomById(roomId!)!;
    final participants = await room.requestParticipants();
    participants.removeWhere(
      (u) => ![Membership.join, Membership.invite].contains(u.membership),
    );
    final participantsIds = participants.map((p) => p.stateKey).toList();
    final contacts = client.rooms
        .where((r) => r.isDirectChat)
        .map((r) => r.unsafeGetUserFromMemoryOrFallback(r.directChatMatrixID!))
        .toList()
      ..removeWhere((u) => participantsIds.contains(u.stateKey));
    contacts.sort(
      (a, b) => a.calcDisplayname().toLowerCase().compareTo(
            b.calcDisplayname().toLowerCase(),
          ),
    );
    return contacts;
  }

  void inviteAction(BuildContext context, String id) async {
    final room = client.getRoomById(roomId!)!;
    if (OkCancelResult.ok !=
        await showOkCancelAlertDialog(
          context: globalCtx(),
          title: L10n.of(globalCtx())!.inviteContactToGroup(
            room.getLocalizedDisplayname(
              MatrixLocals(L10n.of(globalCtx())!),
            ),
          ),
          okLabel: L10n.of(globalCtx())!.yes,
          cancelLabel: L10n.of(globalCtx())!.cancel,
        )) {
      return;
    }
    final success = await showFutureLoadingDialog(
      context: globalCtx(),
      future: () => room.invite(id),
    );
    if (success.error == null) {
      ScaffoldMessenger.of(globalCtx()).showSnackBar(
        SnackBar(
          content: Text(L10n.of(globalCtx())!.contactHasBeenInvitedToTheGroup),
        ),
      );
    }
  }

  void searchUserWithCoolDown(String text) async {
    coolDown?.cancel();
    coolDown = Timer(
      const Duration(milliseconds: 500),
      () => searchUser(context, text),
    );
  }

  void searchUser(BuildContext context, String text) async {
    coolDown?.cancel();
    if (text.isEmpty) {
      setState(() => foundProfiles = []);
    }
    currentSearchTerm = text;
    if (currentSearchTerm.isEmpty) return;
    if (loading) return;
    setState(() => loading = true);
    SearchUserDirectoryResponse response;
    try {
      response = await client.searchUserDirectory(text, limit: 10);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text((e).toLocalizedString(context))),
      );
      return;
    } finally {
      setState(() => loading = false);
    }
    setState(() {
      foundProfiles = List<Profile>.from(response.results);
      if (text.isValidMatrixId && foundProfiles.indexWhere((profile) => text == profile.userId) == -1) {
        setState(
          () => foundProfiles = [
            Profile.fromJson({'user_id': text}),
          ],
        );
      }
      final participants = client
          .getRoomById(roomId!)!
          .getParticipants()
          .where(
            (user) => [Membership.join, Membership.invite].contains(user.membership),
          )
          .toList();
      foundProfiles.removeWhere(
        (profile) => participants.indexWhere((u) => u.id == profile.userId) != -1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final room = client.getRoomById(roomId!)!;
    final groupName = room.name.isEmpty ? L10n.of(context)!.group : room.name;
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      backgroundColor: constTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "# $groupName",
              onBack: () {
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "# $groupName",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ),
      body: foundProfiles.isNotEmpty
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: foundProfiles.length,
              itemBuilder: (BuildContext context, int i) => ListTile(
                leading: Avatar(
                  id: foundProfiles[i].userId,
                  mxContent: foundProfiles[i].avatarUrl,
                  name: foundProfiles[i].displayName ?? foundProfiles[i].userId,
                ),
                title: Text(
                  foundProfiles[i].displayName ?? foundProfiles[i].userId.localpart!,
                ),
                subtitle: Text(foundProfiles[i].userId),
                onTap: () => inviteAction(
                  context,
                  foundProfiles[i].userId,
                ),
              ),
            )
          : FutureBuilder<List<User>>(
              future: getContacts(context),
              builder: (BuildContext context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                  );
                }
                final contacts = snapshot.data!;
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contacts.length,
                  itemBuilder: (BuildContext context, int i) => ListTile(
                    leading: Avatar(
                      id: contacts[i].id,
                      mxContent: contacts[i].avatarUrl,
                      name: contacts[i].calcDisplayname(),
                    ),
                    title: Text(
                      contacts[i].calcDisplayname(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      contacts[i].id,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: constTheme.centerChannelColor,
                      ),
                    ),
                    onTap: () => inviteAction(context, contacts[i].id),
                  ),
                );
              },
            ),
    );
  }
}
