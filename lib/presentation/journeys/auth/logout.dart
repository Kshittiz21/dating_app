import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_google/google_auth.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text("Logged In"),
          ),
          TextButton(
              onPressed: () {
                Provider.of<GoogleAuth>(context, listen: false).logout(context);
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
