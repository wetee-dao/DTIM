import 'package:flutter/material.dart';

class HoverListItem extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHighlightChanged;
  final MouseCursor mouseCursor;
  final ButtonTextTheme? textTheme;
  final ButtonTextTheme? hoverTextTheme;
  final Color? textColor;
  final Color? hoverTextColor;
  final Color? disabledTextColor;
  final Color? color;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Brightness? colorBrightness;
  final Brightness? hoverColorBrightness;
  final double elevation;
  final double? focusElevation;
  final double hoverElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry hoverPadding;
  final VisualDensity? visualDensity;
  final ShapeBorder shape;
  final ShapeBorder? hoverShape;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Duration? animationDuration;
  final double? minWidth;
  final double? height;
  final bool enableFeedback;
  final Widget child;
  final Widget? trailing;
  const HoverListItem({
    Key? key,
    required this.onPressed,
    required this.child,
    this.animationDuration,
    this.autofocus = false,
    this.trailing,
    this.clipBehavior = Clip.none,
    this.color,
    this.colorBrightness,
    this.disabledColor,
    this.disabledElevation,
    this.disabledTextColor,
    this.elevation = 0,
    this.enableFeedback = true,
    this.focusColor,
    this.focusElevation,
    this.focusNode,
    this.height,
    this.highlightColor,
    this.highlightElevation,
    this.hoverColor,
    this.hoverElevation = 0,
    this.materialTapTargetSize,
    this.minWidth,
    this.mouseCursor = SystemMouseCursors.click,
    this.onHighlightChanged,
    this.onLongPress,
    this.padding = const EdgeInsets.all(0),
    this.hoverPadding = const EdgeInsets.all(0),
    this.shape = const RoundedRectangleBorder(
      //边框圆角
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    ),
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.visualDensity,
    this.hoverShape,
    this.hoverTextColor,
    this.hoverTextTheme,
    this.hoverColorBrightness,
  }) : super(key: key);

  @override
  HoverListItemState createState() => HoverListItemState();
}

class HoverListItemState extends State<HoverListItem> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
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
      child: MaterialButton(
        key: widget.key,
        onPressed: widget.onPressed,
        onHighlightChanged: widget.onHighlightChanged,
        onLongPress: widget.onLongPress,
        textTheme: _isHover ? widget.hoverTextTheme ?? widget.textTheme : widget.textTheme,
        color: widget.color,
        colorBrightness: _isHover ? widget.hoverColorBrightness ?? widget.colorBrightness : widget.colorBrightness,
        disabledColor: widget.disabledColor,
        disabledTextColor: widget.disabledTextColor,
        elevation: widget.elevation,
        disabledElevation: widget.disabledElevation,
        focusElevation: widget.focusElevation,
        highlightElevation: widget.highlightElevation,
        hoverElevation: widget.hoverElevation,
        enableFeedback: widget.enableFeedback,
        focusColor: widget.focusColor,
        highlightColor: widget.highlightColor,
        hoverColor: widget.hoverColor,
        splashColor: widget.splashColor,
        shape: _isHover ? widget.hoverShape ?? widget.shape : widget.shape,
        clipBehavior: widget.clipBehavior,
        mouseCursor: widget.mouseCursor,
        materialTapTargetSize: widget.materialTapTargetSize,
        minWidth: widget.minWidth,
        animationDuration: widget.animationDuration,
        autofocus: widget.autofocus,
        textColor: _isHover ? widget.hoverTextColor ?? widget.textColor : widget.textColor,
        visualDensity: widget.visualDensity,
        focusNode: widget.focusNode,
        height: widget.height,
        padding: _isHover ? widget.hoverPadding : widget.padding,
        child: widget.trailing == null || !_isHover
            ? widget.child
            : Row(
                children: [
                  Expanded(child: widget.child),
                  widget.trailing!,
                ],
              ),
      ),
    );
  }
}
