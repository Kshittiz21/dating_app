import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/presentation/journeys/auth/auth_google/google_auth.dart';
import 'package:dating_app/presentation/journeys/auth/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInContainer extends StatefulWidget {
  const SignInContainer({Key? key}) : super(key: key);

  @override
  _SignInContainerState createState() => _SignInContainerState();
}

class _SignInContainerState extends State<SignInContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_10),
            child: Card(
              //color: Colors.green.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.dimen_10),
              ),
              elevation: Sizes.dimen_8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_10),
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
            padding: const EdgeInsets.only(
              left: Sizes.dimen_10,
              top: Sizes.dimen_10,
              right: Sizes.dimen_10,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.dimen_10),
              ),
              elevation: Sizes.dimen_8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_10),
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
            padding: const EdgeInsets.only(left: Sizes.dimen_8),
            child: TextButton(
              onPressed: () {
                //Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              child: Text('Forgot Your Password?'),
            ),
          ),
          Center(
            child: Container(
              width: deviceSize.width * 0.7,
              height: deviceSize.height * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_10),
                child: ElevatedButton(
                  onPressed: () {},
                  //isLoading ? null : () => _submit(context),
                  child: isLoading
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
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: deviceSize.width * 0.7,
              height: deviceSize.height * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_10),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<GoogleAuth>(context, listen: false).login();
                  },
                  //isLoading ? null : () => _submit(context),
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Text('Sign In with Google'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orange.shade400),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: deviceSize.width * 0.7,
              height: deviceSize.height * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_10),
                child: ElevatedButton(
                  onPressed: () {},
                  //isLoading ? null : () => _submit(context),
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Text('Sign In with Facebook'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orange.shade400),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
