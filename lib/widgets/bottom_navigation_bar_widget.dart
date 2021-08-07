import 'package:dating_app/presentation/journeys/home/homepage.dart';
import 'package:dating_app/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_mosaic, color: AppColors.mediumPink),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: AppColors.mediumPink), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.message, color: AppColors.mediumPink), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.face, color: AppColors.mediumPink), label: ''),
      ],
    );
  }
}
