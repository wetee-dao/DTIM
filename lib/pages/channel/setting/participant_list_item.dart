import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import '../../../store/theme.dart';
import '../../../utils/adaptive_bottom_sheet.dart';
import '../../../components/avatar.dart';

class ParticipantListItem extends StatelessWidget {
  final User user;

  const ParticipantListItem(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final membershipBatch = <Membership, String>{
      Membership.join: '',
      Membership.ban: L10n.of(context)!.banned,
      Membership.invite: L10n.of(context)!.invited,
      Membership.leave: L10n.of(context)!.leftTheChat,
    };
    final permissionBatch = user.powerLevel == 100
        ? L10n.of(context)!.admin
        : user.powerLevel >= 50
            ? L10n.of(context)!.moderator
            : '';

    return Opacity(
      opacity: user.membership == Membership.join ? 1 : 0.5,
      child: ListTile(
        // onTap: () => showAdaptiveBottomSheet(
        //   context: context,
        //   builder: (c) => UserBottomSheet(
        //     user: user,
        //     outerContext: context,
        //   ),
        // ),
        title: Row(
          children: <Widget>[
            Text(user.calcDisplayname()),
            if (permissionBatch.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: constTheme.centerChannelBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: constTheme.centerChannelColor,
                  ),
                ),
                child: Text(
                  permissionBatch,
                  style: TextStyle(
                    fontSize: 14,
                    color: constTheme.centerChannelColor,
                  ),
                ),
              ),
            membershipBatch[user.membership]!.isEmpty
                ? Container()
                : Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text(membershipBatch[user.membership]!)),
                  ),
          ],
        ),
        subtitle: Text(user.id),
        leading: Avatar(id: user.id, mxContent: user.avatarUrl, name: user.calcDisplayname()),
      ),
    );
  }
}
