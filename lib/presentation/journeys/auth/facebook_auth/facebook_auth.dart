import 'package:dating_app/domain/entities/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

class FacebookSignin with ChangeNotifier {
  String? email;
  String? displayName;

  login(BuildContext context) async {
    var loginResult =
        await FacebookAuth.i.login(permissions: ["public_profile", "email"]);

    if (loginResult.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i
          .getUserData(fields: "name,email,picture.width(200)");

      displayName = requestData['name'];
      email = requestData['email'];
      print(displayName);
      print(email);
      Provider.of<UserData>(context, listen: false)
          .updateUserData(email, displayName);
    }
  }

  logout(BuildContext context) async {
    await FacebookAuth.i.logOut();
    Provider.of<UserData>(context, listen: false)
        .updateUserData(email, displayName);
    email = displayName = null;
  }
}
