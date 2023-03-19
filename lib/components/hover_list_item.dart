import 'package:flutter/material.dart';

class HoverListItem extends StatefulWidget {
  final bool? ishover;
  final Color? color;
  final Color? hoverColor;
  final VoidCallback onPressed;
  final Widget? trailing;
  final Widget child;

  const HoverListItem({
    Key? key,
    required this.onPressed,
    required this.child,
    this.trailing,
    this.color,
    this.hoverColor,
    this.ishover,
  }) : super(key: key);

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
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => widget.onPressed(),
        child: Container(
          key: widget.key,
          color: calcHover ? widget.hoverColor : widget.color,
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
