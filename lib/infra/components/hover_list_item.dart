import 'package:dtim/application/chain/wetee/wetee_gen/types/frame_support/dispatch/raw_origin.dart';
import 'package:flutter/material.dart';

class HoverListItem extends StatefulWidget {
  final bool? ishover;
  final Color? color;
  final Color? hoverColor;
  final VoidCallback onPressed;
  final Function(bool)? onHover;
  final Widget? trailing;
  final Widget child;
  final String subkey;
  final double radius;
  final EdgeInsetsGeometry? margin;

  const HoverListItem({
    super.key,
    required this.onPressed,
    required this.child,
    this.trailing,
    this.color,
    this.hoverColor,
    this.ishover,
    required this.subkey,
    this.onHover,
    this.radius = 0,
    this.margin,
  });

  @override
  HoverListItemState createState() => HoverListItemState();
}

class HoverListItemState extends State<HoverListItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    bool calcHover = _isHover || (widget.ishover != null && widget.ishover!);
    return MouseRegion(
      onEnter: (event) {
        widget.onHover?.call(true);
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        widget.onHover?.call(false);
        setState(() {
          _isHover = false;
        });
      },
      child: GestureDetector(
        key: Key(widget.subkey),
        behavior: HitTestBehavior.translucent,
        onTap: () => widget.onPressed(),
        child: Container(
          margin: widget.margin,
          decoration: BoxDecoration(
            borderRadius: widget.radius > 0 ? BorderRadius.circular(widget.radius) : BorderRadius.zero,
            color: calcHover ? widget.hoverColor : widget.color,
          ),
          child: widget.trailing == null
              ? widget.child
              : Row(
                  children: [
                    Expanded(child: widget.child),
                    Visibility(visible: calcHover, child: widget.trailing!),
                  ],
                ),
        ),
      ),
    );
  }
}
