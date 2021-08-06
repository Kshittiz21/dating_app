import 'package:dating_app/common/constants/image_constants.dart';
import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/presentation/journeys/auth/sign_in_screen.dart';
import 'package:dating_app/presentation/journeys/auth/sign_up_container.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/sign_up_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Sizes.dimen_18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: Sizes.dimen_14),
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: Sizes.dimen_14),
            child: Text(
              'Meet People You Like',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: Sizes.dimen_20),
            ),
          ),
          SizedBox(
            height: Sizes.dimen_20,
          ),
          Center(
            child: Image.asset(
              Images.tinderLogo,
              fit: BoxFit.cover,
              //height: Sizes.dimen_80.h,
              height: Sizes.dimen_100,
            ),
          ),
          SignUpContainer(),
          SizedBox(height: Sizes.dimen_18),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: Sizes.dimen_8),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignInScreen.routeName);
                },
                child: Text('Already have an account? Sign In instead!'),
                // style: ButtonStyle(Theme.of(context).textTheme.button),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
