import 'package:dating_app/domain/entities/user_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleAuth with ChangeNotifier {
  var _googleAuth = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  String? email;
  String? displayName;

  void login(BuildContext context) async {
    // googleSignInAccount = await _googleAuth.signIn();
    // email = googleSignInAccount?.email;
    // displayName = googleSignInAccount?.displayName;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? user = (await _auth.signInWithCredential(credential)).user;
    displayName = user!.displayName;
    email = user.email;
    print(user.displayName);
    print(user.email);
    user.uid;
    print(user.emailVerified);

    Provider.of<UserModel>(context, listen: false).updateEmail(email);
  }

  void logout(BuildContext context) async {
    googleSignInAccount = await _googleAuth.signOut();
    Provider.of<UserModel>(context, listen: false).updateEmail(null);
  }
}
