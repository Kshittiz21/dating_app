import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/common/screen_util/screen_util.dart';
import 'package:dating_app/domain/entities/user_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/journeys/auth/sign_in_screen.dart';
import 'package:dating_app/presentation/journeys/home/homepage.dart';
import 'package:dating_app/presentation/journeys/profile/update_profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControllerAuth extends StatelessWidget {
  const ControllerAuth({Key? key}) : super(key: key);

  Future<bool> isNewUser(String uid) async {
    bool isNew = false;

    await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: uid)
        .get()
        .then((value) {
      print("Len:" + value.docs.length.toString());
      if (value.docs.length == 0) {
        isNew = true;
        print("isNew" + isNew.toString());
      }
    });
    print("isNew " + isNew.toString());

    return isNew;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

    return Scaffold(
        body: Consumer<UserModel>(builder: (context, userData, child) {
      if (userData.email == null) return SignInScreen();

      return FutureBuilder(
          future: isNewUser(userData.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            // if (snapshot.connectionState == ConnectionState.done) {
            bool isNew = snapshot.data as bool;
            print("isNew isNew:" + isNew.toString());
            if (isNew) {
              print("update profile returned");
              return UpdateProfile();
            } else {
              print(userData.uid);
              return HomePage();
            }
          }
          // return SizedBox.shrink();
          );
    }));
  }
}
