import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Color backGroundColor;
  final Color iconColor;
  final double iconSize;
  final IconData iconData;

  CustomIcon({
    Key? key,
    required this.backGroundColor,
    required this.iconColor,
    required this.iconSize,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: iconSize * 1.3,
        width: iconSize * 1.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(iconSize),
            color: backGroundColor),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
