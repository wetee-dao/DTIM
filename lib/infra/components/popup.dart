import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dtim/domain/utils/screen/screen.dart';

enum PressType { longPress, singleClick, mouseHover }

enum PreferredPosition {
  bottomLeft,
  bottomCenter,
  bottomRight,
  topLeft,
  topCenter,
  topRight,
  rightTop,
}

class BasePopupMenuController extends ChangeNotifier {
  bool menuIsShowing = false;

  void showMenu() {
    menuIsShowing = true;
    notifyListeners();
  }

  void hideMenu() {
    menuIsShowing = false;
    notifyListeners();
  }

  void toggleMenu() {
    menuIsShowing = !menuIsShowing;
    notifyListeners();
  }
}

class BasePopupMenu extends StatefulWidget {
  const BasePopupMenu({
    Key? key,
    required this.child,
    required this.menuBuilder,
    required this.pressType,
    this.controller,
    this.arrowColor = const Color(0xFF4C4C4C),
    this.showArrow = true,
    this.barrierColor = Colors.transparent,
    this.arrowSize = 10.0,
    this.horizontalMargin = 10.0,
    this.verticalMargin = 10.0,
    this.position,
    this.menuOnChange,
    this.enablePassEvent = true,
  }) : super(key: key);

  final Widget child;
  final PressType pressType;
  final bool showArrow;
  final Color arrowColor;
  final Color barrierColor;
  final double horizontalMargin;
  final double verticalMargin;
  final double arrowSize;
  final BasePopupMenuController? controller;
  final Widget Function() menuBuilder;
  final PreferredPosition? position;
  final void Function(bool)? menuOnChange;

  /// Pass tap event to the widgets below the mask.
  /// It only works when [barrierColor] is transparent.
  final bool enablePassEvent;

  @override
  BasePopupMenuState createState() => BasePopupMenuState();
}

class BasePopupMenuState extends State<BasePopupMenu> {
  RenderBox? _childBox;
  RenderBox? _parentBox;
  OverlayEntry? _overlayEntry;
  BasePopupMenuController? _controller;
  bool _canResponse = true;
  Rect menuRect = Rect.zero;
  Rect childRect = Rect.zero;

  _showMenu() {
    Widget arrow = ClipPath(
      clipper: _ArrowClipper(),
      child: Container(
        width: widget.arrowSize,
        height: widget.arrowSize,
        color: widget.arrowColor,
      ),
    );

    //widget.horizontalMargin, widget.verticalMargin
    print(
        'widget.horizontalMargin: ${widget.horizontalMargin}, widget.verticalMargin: ${widget.verticalMargin}');
    _overlayEntry = OverlayEntry(
      builder: (context) {
        Widget menu = Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: _parentBox!.size.width,
              minWidth: 0,
            ),
            child: CustomMultiChildLayout(
              delegate: _MenuLayoutDelegate(
                anchorSize: _childBox!.size,
                anchorOffset: _childBox!.localToGlobal(
                  Offset(-widget.horizontalMargin, 0),
                ),
                verticalMargin: widget.verticalMargin,
                position: widget.position,
                onRectChange: (mr, cr) {
                  menuRect = mr;
                  childRect = cr;
                },
              ),
              children: <Widget>[
                if (widget.showArrow)
                  LayoutId(
                    id: _MenuLayoutId.arrow,
                    child: arrow,
                  ),
                if (widget.showArrow)
                  LayoutId(
                    id: _MenuLayoutId.downArrow,
                    child: Transform.rotate(
                      angle: math.pi,
                      child: arrow,
                    ),
                  ),
                LayoutId(
                  id: _MenuLayoutId.content,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: widget.menuBuilder(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

        return Listener(
          behavior: widget.enablePassEvent
              ? HitTestBehavior.translucent
              : HitTestBehavior.opaque,
          onPointerDown: (PointerDownEvent event) {
            if (widget.pressType == PressType.mouseHover) {
              return;
            }
            Offset offset = event.localPosition;

            // 扩大鼠标面积
            final childRectWrap = Rect.fromLTRB(
              childRect.left - 10.w,
              childRect.top - 10.w,
              childRect.right + 10.w,
              childRect.bottom + 10.w,
            );
            if (childRectWrap.contains(Offset(offset.dx, offset.dy))) {
              return;
            }
            // If tap position in menu
            if (menuRect.contains(Offset(offset.dx - widget.horizontalMargin,
                offset.dy - widget.verticalMargin))) {
              return;
            }

            _controller?.hideMenu();
            _canResponse = false;
            Future.delayed(const Duration(milliseconds: 300))
                .then((_) => _canResponse = true);
          },
          onPointerHover: (PointerHoverEvent event) {
            if (widget.pressType != PressType.mouseHover) {
              return;
            }
            Offset offset = event.localPosition;

            // 扩大鼠标面积
            final childRectWrap = Rect.fromLTRB(
              childRect.left - 10.w,
              childRect.top - 10.w,
              childRect.right + 10.w,
              childRect.bottom + 10.w,
            );
            if (childRectWrap.contains(Offset(offset.dx, offset.dy))) {
              return;
            }

            // If tap position in menu
            if (menuRect.contains(Offset(
              offset.dx - widget.horizontalMargin,
              offset.dy - widget.verticalMargin,
            ))) {
              return;
            }

            _controller?.hideMenu();
            _canResponse = false;
            Future.delayed(const Duration(milliseconds: 300))
                .then((_) => _canResponse = true);
          },
          child: widget.barrierColor == Colors.transparent
              ? menu
              : Container(color: widget.barrierColor, child: menu),
        );
      },
    );
    if (_overlayEntry != null) {
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  _hideMenu() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  _updateView() {
    bool menuIsShowing = _controller?.menuIsShowing ?? false;
    widget.menuOnChange?.call(menuIsShowing);
    if (menuIsShowing) {
      _showMenu();
    } else {
      _hideMenu();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller ??= BasePopupMenuController();
    _controller?.addListener(_updateView);
    WidgetsBinding.instance.addPostFrameCallback((call) {
      if (mounted) {
        _childBox = context.findRenderObject() as RenderBox?;
        _parentBox =
            Overlay.of(context).context.findRenderObject() as RenderBox?;
      }
    });
  }

  @override
  void dispose() {
    _hideMenu();
    _controller?.removeListener(_updateView);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isPc() && widget.pressType == PressType.mouseHover) {
      return MouseRegion(
        child: widget.child,
        onHover: (e) {
          if (_controller == null || !_controller!.menuIsShowing) {
            _controller?.showMenu();
          }
        },
      );
    }

    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: widget.child,
      onTap: () {
        if (widget.pressType == PressType.singleClick && _canResponse) {
          if (_controller != null && _controller!.menuIsShowing) {
            _controller?.hideMenu();
          } else {
            _controller?.showMenu();
          }
        }
      },
      onLongPress: () {
        if ((widget.pressType == PressType.longPress ||
                (!isPc() && widget.pressType == PressType.mouseHover)) &&
            _canResponse) {
          if (_controller != null && _controller!.menuIsShowing) {
            _controller?.hideMenu();
          } else {
            _controller?.showMenu();
          }
        }
      },
    );
  }
}

enum _MenuLayoutId {
  arrow,
  downArrow,
  content,
}

class _MenuLayoutDelegate extends MultiChildLayoutDelegate {
  _MenuLayoutDelegate({
    required this.anchorSize,
    required this.anchorOffset,
    required this.verticalMargin,
    required this.onRectChange,
    this.position,
  });

  final Size anchorSize;
  final Offset anchorOffset;
  final double verticalMargin;
  final PreferredPosition? position;
  final Function(Rect, Rect) onRectChange;

  @override
  void performLayout(Size size) {
    Size contentSize = Size.zero;
    Size arrowSize = Size.zero;
    Offset contentOffset = const Offset(0, 0);
    Offset arrowOffset = const Offset(0, 0);

    double anchorCenterX = anchorOffset.dx + anchorSize.width / 2;
    double anchorTopY = anchorOffset.dy;
    double anchorBottomY = anchorTopY + anchorSize.height;
    PreferredPosition menuPosition =
        position != null ? position! : PreferredPosition.bottomCenter;

    if (hasChild(_MenuLayoutId.content)) {
      contentSize = layoutChild(
        _MenuLayoutId.content,
        BoxConstraints.loose(size),
      );
    }
    if (hasChild(_MenuLayoutId.arrow)) {
      arrowSize = layoutChild(
        _MenuLayoutId.arrow,
        BoxConstraints.loose(size),
      );
    }
    if (hasChild(_MenuLayoutId.downArrow)) {
      layoutChild(
        _MenuLayoutId.downArrow,
        BoxConstraints.loose(size),
      );
    }

    switch (menuPosition) {
      case PreferredPosition.bottomCenter:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorBottomY + verticalMargin,
        );
        contentOffset = Offset(
          anchorCenterX - contentSize.width / 2,
          anchorBottomY + verticalMargin + arrowSize.height,
        );
        break;
      case PreferredPosition.bottomLeft:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorBottomY + verticalMargin,
        );
        contentOffset = Offset(
          anchorCenterX - anchorSize.width / 2,
          anchorBottomY + verticalMargin + arrowSize.height,
        );
        break;
      case PreferredPosition.bottomRight:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorBottomY + verticalMargin,
        );
        contentOffset = Offset(
          anchorCenterX + anchorSize.width / 2 - contentSize.width,
          anchorBottomY + verticalMargin + arrowSize.height,
        );
        break;
        ///
      case PreferredPosition.topCenter:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorTopY - verticalMargin - arrowSize.height,
        );
        contentOffset = Offset(
          anchorCenterX - contentSize.width / 2,
          anchorTopY - verticalMargin - arrowSize.height - contentSize.height,
        );
        break;
      case PreferredPosition.topLeft:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorTopY - verticalMargin - arrowSize.height,
        );
        contentOffset = Offset(
          anchorCenterX - anchorSize.width / 2,
          anchorTopY - verticalMargin - arrowSize.height - contentSize.height,
        );
        break;
      case PreferredPosition.topRight:
        arrowOffset = Offset(
          anchorCenterX - arrowSize.width / 2,
          anchorTopY - verticalMargin - arrowSize.height,
        );
        contentOffset = Offset(
          anchorCenterX + anchorSize.width / 2 - contentSize.width,
          anchorTopY - verticalMargin - arrowSize.height - contentSize.height,
        );
        break;
      case PreferredPosition.rightTop:
        arrowOffset = Offset(
          anchorOffset.dx + anchorSize.width + verticalMargin,
          anchorTopY,
        );
        contentOffset = Offset(
          anchorOffset.dx + anchorSize.width + verticalMargin + arrowSize.width,
          anchorTopY ,
        );
    }

    if (hasChild(_MenuLayoutId.content)) {
      positionChild(_MenuLayoutId.content, contentOffset);
    }

    onRectChange(
      Rect.fromLTWH(
        contentOffset.dx,
        contentOffset.dy,
        contentSize.width,
        contentSize.height,
      ),
      Rect.fromLTWH(
        anchorOffset.dx,
        anchorOffset.dy,
        anchorSize.width,
        anchorSize.height,
      ),
    );

    bool isBottom = false;
    if (PreferredPosition.values.indexOf(menuPosition) < 3) {
      isBottom = true;
    }
    if (hasChild(_MenuLayoutId.arrow)) {
      positionChild(
        _MenuLayoutId.arrow,
        isBottom
            ? Offset(arrowOffset.dx, arrowOffset.dy + 0.1)
            : Offset(-100, 0),
      );
    }
    if (hasChild(_MenuLayoutId.downArrow)) {
      positionChild(
        _MenuLayoutId.downArrow,
        !isBottom
            ? Offset(arrowOffset.dx, arrowOffset.dy - 0.1)
            : Offset(-100, 0),
      );
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}

class _ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
