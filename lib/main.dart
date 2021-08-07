import 'package:dating_app/presentation/journeys/auth/sign_in_screen.dart';
import 'package:dating_app/presentation/journeys/auth/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignInScreen(),
        routes: {
          SignInScreen.routeName: (ctx) => SignInScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
        });
  }
}
