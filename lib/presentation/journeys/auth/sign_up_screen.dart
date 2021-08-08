import 'package:dating_app/common/constants/image_constants.dart';
import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/presentation/journeys/auth/sign_in_screen.dart';
import 'package:dating_app/presentation/journeys/auth/sign_up_container.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/common/extensions/size_extensions.dart';

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
            height: Sizes.dimen_24.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: Sizes.dimen_14.w),
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Sizes.dimen_14.w),
            child: Text(
              'Get Started',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: Sizes.dimen_20.w),
            ),
          ),
          SizedBox(height: Sizes.dimen_20.w),
          Center(
            child: Image.asset(
              Images.tinderLogo4,
              fit: BoxFit.cover,
              //height: Sizes.dimen_80.h,
              height: Sizes.dimen_100.w,
            ),
          ),
          Center(
            child: Text(
              'Meet People You Like',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: Sizes.dimen_20.w),
            ),
          ),
          SizedBox(height: Sizes.dimen_20.w),
          SignUpContainer(),
          SizedBox(height: Sizes.dimen_20.w),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: Sizes.dimen_8.w),
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
