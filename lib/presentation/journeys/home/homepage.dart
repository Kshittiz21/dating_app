import 'package:dating_app/presentation/journeys/auth/auth_google/google_auth.dart';
import 'package:dating_app/presentation/journeys/auth/logout.dart';
import 'package:dating_app/presentation/journeys/details/detail_screen.dart';
import 'package:dating_app/presentation/journeys/details/liked_profile_screen.dart';
import 'package:dating_app/presentation/journeys/profile/update_profile.dart';
import 'package:dating_app/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

int selectedIndex = 0;

class HomePage extends StatefulWidget {
    static const routeName = '/home-page';

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<Widget> screenList = [
  DetailScreen(),
  LikedProfileScreen(),
  UpdateProfile(),
  LogOut(),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(selectedIndex);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.auto_awesome_mosaic, color: AppColors.mediumPink),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: AppColors.mediumPink),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.message, color: AppColors.mediumPink),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.face, color: AppColors.mediumPink), label: ''),
        ],
      ),
      body: screenList[selectedIndex],
    );
  }
}
