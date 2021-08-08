import 'package:dating_app/domain/entities/user_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleAuth with ChangeNotifier {
  var _googleAuth = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  String? email;
  String? displayName;

  void login(BuildContext context) async {
    googleSignInAccount = await _googleAuth.signIn();
    email = googleSignInAccount?.email;
    displayName = googleSignInAccount?.displayName;
    Provider.of<UserModel>(context, listen: false).updateEmail(email);
    // notifyListeners();
  }

  void logout(BuildContext context) async {
    googleSignInAccount = await _googleAuth.signOut();
    Provider.of<UserModel>(context, listen: false).updateEmail(null);
    // notifyListeners();
  }
}
