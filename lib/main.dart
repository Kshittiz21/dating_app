import 'package:dating_app/presentation/journeys/auth/auth_google/google_auth.dart';
import 'package:dating_app/presentation/journeys/auth/controller_auth.dart';
import 'package:dating_app/presentation/journeys/auth/sign_in_screen.dart';
import 'package:dating_app/presentation/journeys/auth/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleAuth>(
          create: (_) => GoogleAuth(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ControllerAuth(),
          routes: {
            SignInScreen.routeName: (ctx) => SignInScreen(),
            SignUpScreen.routeName: (ctx) => SignUpScreen(),
          }),
    );
  }
}
