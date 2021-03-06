import 'package:dating_app/common/constants/image_constants.dart';
import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/domain/entities/user_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/journeys/auth/auth_google/google_auth.dart';
import 'package:dating_app/presentation/journeys/auth/validators.dart';
import 'package:dating_app/presentation/journeys/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dating_app/common/extensions/size_extensions.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignInContainer extends StatefulWidget {
  const SignInContainer({Key? key}) : super(key: key);

  @override
  _SignInContainerState createState() => _SignInContainerState();
}

class _SignInContainerState extends State<SignInContainer> {
  final _auth = FirebaseAuth.instance;
  late UserCredential userCredential;
  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _submit(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
        print("SetState1 true");
      });
      if (!_formKey.currentState!.validate()) {
        // INVALID
        setState(() {
          _isLoading = false;
          print("SetState2 false");
        });
        return;
      }
      _formKey.currentState!.save();
      userCredential = await _auth.signInWithEmailAndPassword(
        email: _authData['email'].toString(),
        password: _authData['password'].toString(),
      );
      String? email = userCredential.user?.email;
      String? displayName = userCredential.user?.displayName;
      Provider.of<UserModel>(context, listen: false).updateEmail(
        email,
        userCredential.user!.uid,
      );

      setState(() {
        _isLoading = false;
        print("SetState2 false");
      });
    } on PlatformException catch (err) {
      var message = 'An error occured, please check your credentials!';

      if (err.message != null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
        print("SetState3 false");
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
        print("SetState4 false");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_10.w),
            child: Card(
              //color: Colors.green.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.dimen_10),
              ),
              elevation: Sizes.dimen_8.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_10.w),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    bool check = Validators.isValidEmail(value!);
                    if (check) return null;
                    return "INVALID_EMAIL";
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Sizes.dimen_10.w,
              top: Sizes.dimen_10.w,
              right: Sizes.dimen_10.w,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
              ),
              elevation: Sizes.dimen_8.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_10.w),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  // controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length <= 5) {
                      return 'Password is too short';
                    }
                    return null;
                    // bool check = Validators.isValidPassword(value);
                    // if (check) return null;
                    // return "INVALID_PASSWORD";
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Sizes.dimen_8.w),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HomePage.routeName);
              },
              child: Text('Forgot Password?'),
            ),
          ),
          Center(
            child: Container(
              width: deviceSize.width * 0.7,
              height: deviceSize.height * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_10.w),
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () => _submit(context),
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Text('Sign In'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orange.shade400),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: Sizes.dimen_20.w),
          InkWell(
            onTap: () {
              Provider.of<GoogleAuth>(context, listen: false).login(context);
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //width: deviceSize.width * 0.2,
                    height: deviceSize.height * 0.07,
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                        //: Text('Sign In with Google'),
                        // : CircleAvatar(
                        //     child:
                        : Image.asset(Images.googleLogo),
                    //),
                  ),
                  Text(' Sign In with Google Instead'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
