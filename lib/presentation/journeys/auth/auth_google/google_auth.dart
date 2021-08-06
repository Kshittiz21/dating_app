import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth with ChangeNotifier {
  var _googleAuth = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  void login() async {
    googleSignInAccount = await _googleAuth.signIn();
    notifyListeners();
  }

  void logout() async {
    googleSignInAccount = await _googleAuth.signOut();
    notifyListeners();
  }
}
