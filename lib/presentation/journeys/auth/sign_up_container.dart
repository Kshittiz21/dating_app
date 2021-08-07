import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/presentation/journeys/auth/validators.dart';
import 'package:dating_app/presentation/journeys/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpContainer extends StatefulWidget {
  const SignUpContainer({Key? key}) : super(key: key);

  @override
  _SignInContainerState createState() => _SignInContainerState();
}

class _SignInContainerState extends State<SignUpContainer> {
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
      });
      if (!_formKey.currentState!.validate()) {
        // INVALID
        setState(() {
          _isLoading = false;
        });
        return;
      }
      _formKey.currentState!.save();
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: _authData['email'].toString(),
        password: _authData['password'].toString(),
      );
      setState(() {
          _isLoading = false;
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
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
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
                  decoration: InputDecoration(labelText: 'username'),
                  validator: (value) {
                    if (value!.length < 3) {
                      return 'Name should be at least of 3 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['username'] = value!;
                  },
                ),
              ),
            ),
          ),
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
                Navigator.of(context).pushNamed(HomePage.routeName);
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
                  onPressed: _isLoading ? null : () => _submit(context),
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Text('Sign Up'),
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
