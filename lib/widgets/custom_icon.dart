import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Color backGroundColor;
  final Color iconColor;
  final double iconSize;
  final IconData iconData;
  final void Function() onTap;

  CustomIcon({
    Key? key,
    required this.backGroundColor,
    required this.iconColor,
    required this.iconSize,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: iconSize * 1.4,
        width: iconSize * 1.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(iconSize),
            color: backGroundColor),
        child: Center(
          child: Icon(
            iconData,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
