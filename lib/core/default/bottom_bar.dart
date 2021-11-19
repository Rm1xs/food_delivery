import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CustomAnimatedBottomBar extends StatefulWidget {
  const CustomAnimatedBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 50,
    this.animationDuration = const Duration(milliseconds: 250),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;


  @override
  State<CustomAnimatedBottomBar> createState() => _CustomAnimatedBottomBarState();
}

class _CustomAnimatedBottomBarState extends State<CustomAnimatedBottomBar> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return Container(
      margin: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 2.h, top: 2.h),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(13),
        color: bgColor,
        boxShadow: [
          if (widget.showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: widget.containerHeight,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: widget.mainAxisAlignment,
              children: widget.items.map((item) {
                var index = widget.items.indexOf(item);
                return GestureDetector(
                  onTap: () => {widget.onItemSelected(index), item.controller.forward()},
                  child: _ItemWidget(
                    controller: item.controller,
                    item: item,
                    iconSize: widget.iconSize,
                    isSelected: index == widget.selectedIndex,
                    backgroundColor: bgColor,
                    itemCornerRadius: widget.itemCornerRadius,
                    animationDuration: widget.animationDuration,
                    curve: widget.curve,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {

  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;
  final AnimationController controller;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? 100 : 40,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color:
              isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected ? 110 : 40,
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor.withOpacity(1)
                        : item.inactiveColor == null
                            ? item.activeColor
                            : item.inactiveColor,
                  ),
                  child: Container(
                    height: 24,
                    width: 24,
                    child: Lottie.asset(
                      item.icon,
                      frameRate: FrameRate.max,
                      repeat: false,
                      controller: item.controller,
                      onLoaded: (composition) {
                        item.controller.duration = composition.duration;
                        //_animationController.forward();
                      },
                    ),
                  ),
                ),
                if (isSelected)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                          color: item.activeColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: item.textAlign,
                        child: item.title,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.controller,
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  final String icon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
  final AnimationController controller;
}
