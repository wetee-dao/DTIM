import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/size_extension.dart';
import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/mxc_image.dart';
import 'package:flutter/material.dart';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:matrix/matrix.dart' as link;

class Reacs extends StatelessWidget {
  final link.Client client;
  final link.Event event;
  final link.Timeline timeline;

  const Reacs(this.event, this.timeline, {Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allReacEvents = event.aggregatedEvents(timeline, link.RelationshipTypes.reaction);
    final reactionMap = <String, _ReacItem>{};

    for (final e in allReacEvents) {
      final key = e.content.tryGetMap<String, dynamic>('m.relates_to')?.tryGet<String>('key');
      if (key != null) {
        if (!reactionMap.containsKey(key)) {
          reactionMap[key] = _ReacItem(
            key: key,
            count: 0,
            reacted: false,
            reactors: [],
          );
        }
        reactionMap[key]!.count++;
        reactionMap[key]!.reactors!.add(e.senderFromMemoryOrFallback);
        reactionMap[key]!.reacted |= e.senderId == e.room.client.userID;
      }
    }

    final reactionList = reactionMap.values.toList();
    reactionList.sort((a, b) => b.count - a.count > 0 ? 1 : -1);
    if (reactionList.isEmpty) return const SizedBox(height: 0);

    return Padding(
      padding: EdgeInsets.only(top: 5.w),
      child: Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: [
          ...reactionList
              .map(
                (r) => _Reac(
                  reactionKey: r.key,
                  count: r.count,
                  reacted: r.reacted,
                  onTap: () {
                    if (r.reacted) {
                      final evt = allReacEvents.firstWhereOrNull(
                        (e) =>
                            e.senderId == e.room.client.userID && e.content.tryGetMap('m.relates_to')?['key'] == r.key,
                      );
                      if (evt != null) {
                        waitFutureLoading(
                          context: context,
                          future: () => evt.redactEvent(),
                        );
                      }
                    } else {
                      event.room.sendReaction(event.eventId, r.key!);
                    }
                  },
                ),
              )
              .toList(),
          if (allReacEvents.any((e) => e.status.isSending))
            const SizedBox(
              width: 28,
              height: 28,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: CircularProgressIndicator.adaptive(strokeWidth: 1),
              ),
            ),
        ],
      ),
    );
  }
}

class _Reac extends StatelessWidget {
  final String? reactionKey;
  final int? count;
  final bool? reacted;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const _Reac({
    this.reactionKey,
    this.count,
    this.reacted,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final fontSize = DefaultTextStyle.of(context).style.fontSize;
    Widget content;
    if (reactionKey!.startsWith('mxc://')) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MxcImage(
            uri: Uri.parse(reactionKey!),
            width: 9999,
            height: fontSize,
          ),
          const SizedBox(width: 4),
          Text(
            count.toString(),
            style: TextStyle(
              color: constTheme.centerChannelColor,
              fontSize: DefaultTextStyle.of(context).style.fontSize,
            ),
          ),
        ],
      );
    } else {
      var renderKey = Characters(reactionKey!);
      if (renderKey.length > 10) {
        renderKey = renderKey.getRange(0, 9) + Characters('…');
      }
      content = Text(
        '$renderKey $count',
        style: TextStyle(
          color: constTheme.centerChannelColor,
          fontSize: DefaultTextStyle.of(context).style.fontSize,
        ),
      );
    }
    return InkWell(
      onTap: () => onTap != null ? onTap!() : null,
      onLongPress: () => onLongPress != null ? onLongPress!() : null,
      borderRadius: BorderRadius.circular(10.w),
      child: Container(
        decoration: BoxDecoration(
          color: constTheme.centerChannelColor.withOpacity(reacted! ? 0.1 : 0.05),
          borderRadius: BorderRadius.circular(4.w),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: content,
      ),
    );
  }
}

class _ReacItem {
  String? key;
  int count;
  bool reacted;
  List<link.User>? reactors;

  _ReacItem({
    this.key,
    required this.count,
    required this.reacted,
    this.reactors,
  });
}
