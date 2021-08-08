import 'package:dating_app/common/screen_util/screen_util.dart';
import 'package:dating_app/domain/entities/user_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/journeys/auth/sign_in_screen.dart';
import 'package:dating_app/presentation/journeys/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControllerAuth extends StatelessWidget {
  const ControllerAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return Scaffold(
        body: Consumer<UserModel>(builder: (context, userData, child) {
      print("controller");
      print(userData);
      if (userData.email != null)
        return HomePage();
      else
        return SignInScreen();
    }));
  }
}
