import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'navigation_bar_item.dart';

// ignore: must_be_immutable
class BottomIndicatorBar extends StatefulWidget {
  final Color indicatorColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final bool shadow;
  final double iconSize;
  final double barHeight;
  int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomIndicatorNavigationBarItem> items;

  BottomIndicatorBar({
    Key? key,
    required this.onTap,
    required this.items,
    this.activeColor = Colors.teal,
    this.inactiveColor = Colors.grey,
    this.indicatorColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.iconSize = 35.0,
    this.barHeight = 60,
    this.shadow = true,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  State createState() => _BottomIndicatorBarState();
}

class _BottomIndicatorBarState extends State<BottomIndicatorBar> {
  static const double INDICATOR_HEIGHT = 2;

  List<BottomIndicatorNavigationBarItem> get items => widget.items;

  double width = 0;
  late Color activeColor;
  Duration duration = Duration(milliseconds: 170);

  double? _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr)
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    else
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeColor;

    return Container(
      height: widget.barHeight + MediaQuery.of(context).viewPadding.bottom,
      width: width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.shadow
            ? [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ]
            : null,
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          Positioned(
            top: INDICATOR_HEIGHT,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index, item),
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            width: width,
            child: AnimatedAlign(
              alignment:
                  Alignment(_getIndicatorPosition(widget.currentIndex)!, 0),
              curve: Curves.linear,
              duration: duration,
              child: Container(
                color: widget.indicatorColor,
                width: width / items.length,
                height: INDICATOR_HEIGHT,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _select(int index, BottomIndicatorNavigationBarItem item) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);

    setState(() {});
  }

  Widget _setIcon(BottomIndicatorNavigationBarItem item, bool isSelected) {
    if (item.icon is IconData) {
      return Icon(
        item.icon,
        color: isSelected ? activeColor : widget.inactiveColor,
        size: widget.iconSize,
      );
    }
    else if (item.icon is String && item.icon.contains('.svg')) {
      if (item.activeIcon != null && item.activeIcon is String) {
        var asset = item.icon;
        if (isSelected) {
          asset = item.activeIcon;
        }
        return SvgPicture.asset(
          asset,
          height: widget.iconSize,
        );
      }
      return SvgPicture.asset(
        item.icon,
        color: isSelected ? activeColor : widget.inactiveColor,
        height: widget.iconSize,
      );
    } else {
      return item.icon;
    }
  }

  Widget _setLabel(BottomIndicatorNavigationBarItem item, bool isSelected) {
    if (item.label == null) {
      return SizedBox.shrink();
    }
    if (item.label is String) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          item.label,
          style:
              TextStyle(color: isSelected ? activeColor : widget.inactiveColor),
        ),
      );
    }
    if (item.label is Text) {
      var textWidget = (item.label as Text);
      if (textWidget.style != null) {
        textWidget.style!.copyWith(color: Colors.white);
      } else {
        return Text(
          textWidget.data!,
          style:
              TextStyle(color: isSelected ? activeColor : widget.inactiveColor),
        );
      }
    }
    return item.label;
  }

  Widget _buildItemWidget(
      BottomIndicatorNavigationBarItem item, bool isSelected) {
    return Container(
      color: item.backgroundColor,
      height: widget.barHeight,
      width: width / items.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [_setIcon(item, isSelected), _setLabel(item, isSelected)],
          ),
        ],
      ),
    );
  }
}
