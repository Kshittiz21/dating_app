import 'package:dating_app/presentation/journeys/auth/auth_google/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                Provider.of<GoogleAuth>(context, listen: false).logout();
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
