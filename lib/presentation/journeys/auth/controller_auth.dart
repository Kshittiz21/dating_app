import 'package:dating_app/presentation/journeys/auth/auth_google/google_auth.dart';
import 'package:dating_app/presentation/journeys/auth/sign_in_screen.dart';
import 'package:dating_app/presentation/journeys/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControllerAuth extends StatelessWidget {
  const ControllerAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<GoogleAuth>(builder: (context, model, child) {
      if (model.googleSignInAccount != null)
        return HomePage();
      else
        return SignInScreen();
    }));
  }
}
