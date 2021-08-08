import 'package:dating_app/domain/entities/user_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/journeys/auth/auth_google/google_auth.dart';
import 'package:dating_app/presentation/journeys/auth/controller_auth.dart';
import 'package:dating_app/presentation/journeys/auth/sign_in_screen.dart';
import 'package:dating_app/presentation/journeys/auth/sign_up_screen.dart';
import 'package:dating_app/presentation/journeys/details/detail_screen.dart';
import 'package:dating_app/presentation/journeys/details/liked_profile_screen.dart';
import 'package:dating_app/presentation/journeys/home/homepage.dart';
import 'package:dating_app/presentation/themes/text_theme.dart';
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
    fetchUserData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleAuth>(
          create: (_) => GoogleAuth(),
        ),
        ChangeNotifierProvider<UserData>(create: (_) => UserData()),
        ChangeNotifierProvider<UserModel>(
          create: (_) => UserModel(
            images: [],
            name: '',
            gender: '',
            age: 18,
            bio: '',
            hobbies: [],
            likedUserList: [],
            email: null,
            uid: '',
            imageUrl: [],
          ),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: ThemeText.getTextTheme(),
          ),
          home: ControllerAuth(),
          // home: LikedProfileScreen(),
          routes: {
            SignInScreen.routeName: (ctx) => SignInScreen(),
            SignUpScreen.routeName: (ctx) => SignUpScreen(),
            HomePage.routeName: (ctx) => HomePage(),
          }),
    );
  }
}
