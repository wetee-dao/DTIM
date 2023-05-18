// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrix/matrix.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../../../router.dart';
import '../../../store/im.dart';
import '../../../store/theme.dart';
import '../../../utils/screen/screen.dart';
import '../../../utils/matrix_sdk_extensions/matrix_locals.dart';
import '../../../utils/platform_infos.dart';

enum AliasActions { copy, delete, setCanonical }

class ChatDetails extends StatefulWidget {
  final String id;
  const ChatDetails({Key? key, required this.id}) : super(key: key);

  @override
  ChatDetailsController createState() => ChatDetailsController();
}

class ChatDetailsController extends State<ChatDetails> {
  List<User>? members;
  bool displaySettings = true;
  late Client client;

  @override
  void initState() {
    super.initState();
    final im = context.read<IMProvider>();
    client = im.currentState!.client;
  }

  void toggleDisplaySettings() => setState(() => displaySettings = !displaySettings);

  String? get roomId => widget.id;

  void setDisplaynameAction() async {
    final room = client.getRoomById(roomId!)!;
    final input = await showTextInputDialog(
      useRootNavigator: false,
      context: context,
      title: L10n.of(context)!.changeTheNameOfTheGroup,
      okLabel: L10n.of(context)!.ok,
      cancelLabel: L10n.of(context)!.cancel,
      textFields: [
        DialogTextField(
          initialText: room.getLocalizedDisplayname(
            MatrixLocals(L10n.of(context)!),
          ),
        )
      ],
    );
    if (input == null) return;
    final success = await waitFutureLoading(
      context: globalCtx(),
      future: () => room.setName(input.single),
    );
    if (success.error == null) {
      ScaffoldMessenger.of(globalCtx()).showSnackBar(
        SnackBar(content: Text(L10n.of(globalCtx())!.displaynameHasBeenChanged)),
      );
    }
  }

  void editAliases() async {
    final room = client.getRoomById(roomId!);

    // The current endpoint doesnt seem to be implemented in Synapse. This may
    // change in the future and then we just need to switch to this api call:
    //
    // final aliases = await waitFutureLoading(
    //   context: context,
    //   future: () => room.client.requestRoomAliases(room.id),
    // );
    //
    // While this is not working we use the unstable api:
    final aliases = await waitFutureLoading(
      context: context,
      future: () => room!.client
          .request(
            RequestType.GET,
            '/client/unstable/org.matrix.msc2432/rooms/${Uri.encodeComponent(room.id)}/aliases',
          )
          .then((response) => List<String>.from(response['aliases'])),
    );
    // Switch to the stable api once it is implemented.

    if (aliases.error != null) return;
    final adminMode = room!.canSendEvent('m.room.canonical_alias');
    if (aliases.result!.isEmpty && (room.canonicalAlias.isNotEmpty)) {
      aliases.result!.add(room.canonicalAlias);
    }
    if (aliases.result!.isEmpty && adminMode) {
      return setAliasAction();
    }
    final select = await showConfirmationDialog(
      useRootNavigator: false,
      context: globalCtx(),
      title: L10n.of(globalCtx())!.editRoomAliases,
      actions: [
        if (adminMode) AlertDialogAction(label: L10n.of(globalCtx())!.create, key: 'new'),
        ...aliases.result!.map((alias) => AlertDialogAction(key: alias, label: alias)).toList(),
      ],
    );
    if (select == null) return;
    if (select == 'new') {
      return setAliasAction();
    }
    final option = await showConfirmationDialog<AliasActions>(
      context: globalCtx(),
      title: select,
      actions: [
        AlertDialogAction(
          label: L10n.of(globalCtx())!.copyToClipboard,
          key: AliasActions.copy,
          isDefaultAction: true,
        ),
        if (adminMode) ...{
          AlertDialogAction(
            label: L10n.of(globalCtx())!.setAsCanonicalAlias,
            key: AliasActions.setCanonical,
            isDestructiveAction: true,
          ),
          AlertDialogAction(
            label: L10n.of(globalCtx())!.delete,
            key: AliasActions.delete,
            isDestructiveAction: true,
          ),
        },
      ],
    );
    if (option == null) return;
    switch (option) {
      case AliasActions.copy:
        await Clipboard.setData(ClipboardData(text: select));
        ScaffoldMessenger.of(globalCtx()).showSnackBar(
          SnackBar(content: Text(L10n.of(globalCtx())!.copiedToClipboard)),
        );
        break;
      case AliasActions.delete:
        await waitFutureLoading(
          context: globalCtx(),
          future: () => room.client.deleteRoomAlias(select),
        );
        break;
      case AliasActions.setCanonical:
        await waitFutureLoading(
          context: globalCtx(),
          future: () => room.client.setRoomStateWithKey(
            room.id,
            EventTypes.RoomCanonicalAlias,
            '',
            {
              'alias': select,
            },
          ),
        );
        break;
    }
  }

  void setAliasAction() async {
    final room = client.getRoomById(roomId!)!;
    final domain = room.client.userID!.domain;

    final input = await showTextInputDialog(
      useRootNavigator: false,
      context: context,
      title: L10n.of(context)!.setInvitationLink,
      okLabel: L10n.of(context)!.ok,
      cancelLabel: L10n.of(context)!.cancel,
      textFields: [
        DialogTextField(
          prefixText: '#',
          suffixText: domain,
          hintText: L10n.of(context)!.alias,
          initialText: room.canonicalAlias.localpart,
        )
      ],
    );
    if (input == null) return;
    await waitFutureLoading(
      context: globalCtx(),
      future: () => room.client.setRoomAlias('#${input.single}:${domain!}', room.id),
    );
  }

  void setTopicAction() async {
    final room = client.getRoomById(roomId!)!;
    final input = await showTextInputDialog(
      useRootNavigator: false,
      context: context,
      title: L10n.of(context)!.setGroupDescription,
      okLabel: L10n.of(context)!.ok,
      cancelLabel: L10n.of(context)!.cancel,
      textFields: [
        DialogTextField(
          hintText: L10n.of(context)!.setGroupDescription,
          initialText: room.topic,
          minLines: 1,
          maxLines: 4,
        )
      ],
    );
    if (input == null) return;
    final success = await waitFutureLoading(
      context: globalCtx(),
      future: () => room.setDescription(input.single),
    );
    if (success.error == null) {
      ScaffoldMessenger.of(globalCtx()).showSnackBar(
        SnackBar(
          content: Text(L10n.of(globalCtx())!.groupDescriptionHasBeenChanged),
        ),
      );
    }
  }

  void setGuestAccessAction(GuestAccess guestAccess) => waitFutureLoading(
        context: context,
        future: () => client.getRoomById(roomId!)!.setGuestAccess(guestAccess),
      );

  void setHistoryVisibilityAction(HistoryVisibility historyVisibility) => waitFutureLoading(
        context: context,
        future: () => client.getRoomById(roomId!)!.setHistoryVisibility(historyVisibility),
      );

  void setJoinRulesAction(JoinRules joinRule) => waitFutureLoading(
        context: context,
        future: () => client.getRoomById(roomId!)!.setJoinRules(joinRule),
      );

  // void goToEmoteSettings() async {
  //   final room = client.getRoomById(roomId!)!;
  //   // okay, we need to test if there are any emote state events other than the default one
  //   // if so, we need to be directed to a selection screen for which pack we want to look at
  //   // otherwise, we just open the normal one.
  //   if ((room.states['im.ponies.room_emotes'] ?? <String, Event>{}).keys.any((String s) => s.isNotEmpty)) {
  //     VRouter.of(context).to('multiple_emotes');
  //   } else {
  //     VRouter.of(context).to('emotes');
  //   }
  // }

  void setAvatarAction() async {
    final room = client.getRoomById(roomId!);
    final actions = [
      if (PlatformInfos.isMobile)
        SheetAction(
          key: AvatarAction.camera,
          label: L10n.of(context)!.openCamera,
          isDefaultAction: true,
          icon: Icons.camera_alt_outlined,
        ),
      SheetAction(
        key: AvatarAction.file,
        label: L10n.of(context)!.openGallery,
        icon: Icons.photo_outlined,
      ),
      if (room?.avatar != null)
        SheetAction(
          key: AvatarAction.remove,
          label: L10n.of(context)!.delete,
          isDestructiveAction: true,
          icon: Icons.delete_outlined,
        ),
    ];
    final action = actions.length == 1
        ? actions.single.key
        : await showModalActionSheet<AvatarAction>(
            context: context,
            title: L10n.of(context)!.editRoomAvatar,
            actions: actions,
          );
    if (action == null) return;
    if (action == AvatarAction.remove) {
      await waitFutureLoading(
        context: globalCtx(),
        future: () => room!.setAvatar(null),
      );
      return;
    }
    MatrixFile file;

    final result = await ImagePicker().pickImage(
      source: action == AvatarAction.camera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );
    if (result == null) return;
    file = MatrixFile(
      bytes: await result.readAsBytes(),
      name: result.path,
    );

    await waitFutureLoading(
      context: globalCtx(),
      future: () => room!.setAvatar(file),
    );
  }

  void requestMoreMembersAction() async {
    final room = client.getRoomById(roomId!);
    final participants = await waitFutureLoading(
      context: context,
      future: () => room!.requestParticipants(),
    );
    if (participants.error == null) {
      setState(() => members = participants.result);
    }
  }

  static const fixedWidth = 360.0;

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    members ??= client.getRoomById(roomId!)!.getParticipants();
    final room = client.getRoomById(roomId!);
    if (room == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context)!.oopsSomethingWentWrong),
        ),
        body: Center(
          child: Text(L10n.of(context)!.youAreNoLongerParticipatingInThisChat),
        ),
      );
    }

    final titleStyle = TextStyle(
      fontSize: 14,
      color: constTheme.centerChannelColor,
      decorationColor: constTheme.centerChannelColor,
    );

    members!.removeWhere((u) => u.membership == Membership.leave);
    // final actualMembersCount = (room.summary.mInvitedMemberCount ?? 0) + (room.summary.mJoinedMemberCount ?? 0);
    // final canRequestMoreMembers = members!.length < actualMembersCount;

    return StreamBuilder(
      stream: room.onUpdate.stream,
      builder: (context, snapshot) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.w),
                child: renderTile(
                  Icons.people_outline_outlined,
                  L10n.of(context)!.changeTheNameOfTheGroup,
                  room.getLocalizedDisplayname(
                    MatrixLocals(L10n.of(context)!),
                  ),
                  onTap: room.canSendEvent(EventTypes.RoomName) ? setDisplaynameAction : null,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.w),
                child: renderTile(
                  Icons.description,
                  L10n.of(context)!.groupDescription,
                  room.topic.isEmpty ? L10n.of(context)!.addGroupDescription : room.topic,
                  onTap: room.canSendEvent(EventTypes.RoomTopic) ? setTopicAction : null,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.w),
                child: renderTile(
                  Icons.link_outlined,
                  L10n.of(context)!.editRoomAliases,
                  (room.canonicalAlias.isNotEmpty) ? room.canonicalAlias : L10n.of(context)!.none,
                  onTap: (room.joinRules == JoinRules.public) ? editAliases : null,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.w),
                child: PopupMenuButton(
                  color: constTheme.centerChannelBg,
                  onSelected: setJoinRulesAction,
                  position: PopupMenuPosition.under,
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<JoinRules>>[
                    if (room.canChangeJoinRules)
                      PopupMenuItem<JoinRules>(
                        value: JoinRules.public,
                        child: Text(
                          JoinRules.public.getLocalizedString(
                            MatrixLocals(L10n.of(context)!),
                          ),
                          style: titleStyle,
                        ),
                      ),
                    if (room.canChangeJoinRules)
                      PopupMenuItem<JoinRules>(
                        value: JoinRules.invite,
                        child: Text(
                          JoinRules.invite.getLocalizedString(
                            MatrixLocals(L10n.of(context)!),
                          ),
                          style: titleStyle,
                        ),
                      ),
                  ],
                  child: renderTile(
                    Icons.shield_outlined,
                    L10n.of(context)!.whoIsAllowedToJoinThisGroup,
                    room.joinRules?.getLocalizedString(
                          MatrixLocals(L10n.of(context)!),
                        ) ??
                        L10n.of(context)!.none,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.w),
                child: PopupMenuButton(
                  color: constTheme.centerChannelBg,
                  onSelected: setHistoryVisibilityAction,
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<HistoryVisibility>>[
                    if (room.canChangeHistoryVisibility)
                      PopupMenuItem<HistoryVisibility>(
                        value: HistoryVisibility.invited,
                        child: Text(
                          HistoryVisibility.invited.getLocalizedString(
                            MatrixLocals(L10n.of(context)!),
                          ),
                          style: titleStyle,
                        ),
                      ),
                    if (room.canChangeHistoryVisibility)
                      PopupMenuItem<HistoryVisibility>(
                        value: HistoryVisibility.joined,
                        child: Text(
                          HistoryVisibility.joined.getLocalizedString(
                            MatrixLocals(L10n.of(context)!),
                          ),
                          style: titleStyle,
                        ),
                      ),
                    if (room.canChangeHistoryVisibility)
                      PopupMenuItem<HistoryVisibility>(
                        value: HistoryVisibility.shared,
                        child: Text(
                          HistoryVisibility.shared.getLocalizedString(
                            MatrixLocals(L10n.of(context)!),
                          ),
                          style: titleStyle,
                        ),
                      ),
                    if (room.canChangeHistoryVisibility)
                      PopupMenuItem<HistoryVisibility>(
                        value: HistoryVisibility.worldReadable,
                        child: Text(
                          HistoryVisibility.worldReadable.getLocalizedString(
                            MatrixLocals(L10n.of(context)!),
                          ),
                          style: titleStyle,
                        ),
                      ),
                  ],
                  child: renderTile(
                    Icons.visibility_outlined,
                    L10n.of(context)!.visibilityOfTheChatHistory,
                    room.historyVisibility?.getLocalizedString(
                          MatrixLocals(L10n.of(context)!),
                        ) ??
                        L10n.of(context)!.none,
                  ),
                ),
              ),

              if (room.joinRules == JoinRules.public)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.w),
                  child: PopupMenuButton(
                    color: constTheme.centerChannelBg,
                    onSelected: setGuestAccessAction,
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<GuestAccess>>[
                      if (room.canChangeGuestAccess)
                        PopupMenuItem<GuestAccess>(
                          value: GuestAccess.canJoin,
                          child: Text(
                            GuestAccess.canJoin.getLocalizedString(MatrixLocals(
                              L10n.of(context)!,
                            )),
                            style: titleStyle,
                          ),
                        ),
                      if (room.canChangeGuestAccess)
                        PopupMenuItem<GuestAccess>(
                          value: GuestAccess.forbidden,
                          child: Text(
                            GuestAccess.forbidden.getLocalizedString(MatrixLocals(
                              L10n.of(context)!,
                            )),
                            style: titleStyle,
                          ),
                        ),
                    ],
                    child: renderTile(
                      Icons.person_add_alt_1_outlined,
                      L10n.of(context)!.areGuestsAllowedToJoin,
                      room.guestAccess.getLocalizedString(
                        MatrixLocals(L10n.of(context)!),
                      ),
                    ),
                  ),
                ),

              // ListTile(
              //   title: Text(
              //     L10n.of(context)!.editChatPermissions,
              //     style: titleStyle,
              //   ),
              //   subtitle: Text(
              //     L10n.of(context)!.whoCanPerformWhichAction,
              //     style: titleStyle,
              //   ),
              //   leading: CircleAvatar(
              //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              //     foregroundColor: iconColor,
              //     child: const Icon(
              //       Icons.edit_attributes_outlined,
              //     ),
              //   ),
              //   // onTap: () => VRouter.of(context).to('permissions'),
              // ),
              SizedBox(height: 20.w),
              // ListTile(
              //   title: Text(
              //     actualMembersCount > 1
              //         ? L10n.of(context)!.countParticipants(
              //             actualMembersCount.toString(),
              //           )
              //         : L10n.of(context)!.emptyChat,
              //     style: TextStyle(
              //       color: constTheme.centerChannelColor,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // room.canInvite
              //     ? ListTile(
              //         title: Text(L10n.of(context)!.inviteContact),
              //         leading: CircleAvatar(
              //           backgroundColor: constTheme.centerChannelBg,
              //           foregroundColor: Colors.white,
              //           radius: 5.w,
              //           child: const Icon(Icons.add_outlined),
              //         ),
              //         onTap: () {})
              //     : Container(),
            ],
          ),
        );
      },
    );
    //   return ListView.builder(
    //     itemCount: members!.length + 1 + (canRequestMoreMembers ? 1 : 0),
    //     itemBuilder: (BuildContext context, int i) => i == 0
    //         ?
    //         : i < members!.length + 1
    //             ? ParticipantListItem(members![i - 1])
    //             : ListTile(
    //                 title: Text(
    //                   L10n.of(context)!.loadCountMoreParticipants(
    //                     (actualMembersCount - members!.length).toString(),
    //                   ),
    //                 ),
    //                 leading: CircleAvatar(
    //                   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //                   child: const Icon(
    //                     Icons.refresh,
    //                     color: Colors.grey,
    //                   ),
    //                 ),
    //                 onTap: requestMoreMembersAction,
    //               ),
    //   );
    // },
  }

  renderTile(IconData ico, String title, String subtitle, {void Function()? onTap}) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final titleStyle = TextStyle(
      fontSize: 14,
      height: 1.3,
      color: constTheme.centerChannelColor,
      decorationColor: constTheme.centerChannelColor,
    );

    return Container(
      // margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.w),
      decoration: BoxDecoration(
        color: constTheme.centerChannelColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: constTheme.centerChannelBg,
          foregroundColor: constTheme.centerChannelColor,
          child: Icon(ico),
        ),
        title: Text(
          title,
          style: titleStyle,
        ),
        subtitle: Text(
          subtitle,
          style: titleStyle,
        ),
        trailing: onTap != null
            ? Icon(
                Icons.edit_outlined,
                color: constTheme.centerChannelColor,
                size: 14.w,
              )
            : null,
      ),
    );
  }
}

enum AvatarAction { camera, file, remove }
