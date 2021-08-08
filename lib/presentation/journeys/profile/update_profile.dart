import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/common/extensions/size_extensions.dart';
import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/domain/entities/user_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

var userData = UserModel(
  images: [],
  name: '',
  gender: '',
  age: 18,
  bio: '',
  hobbies: [],
  likedUserList: [],
  email: null,
  uid: '',
);

class UpdateProfile extends StatefulWidget {
  static const routeName = '/update-profile';

  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController controller = TextEditingController();
  bool _isLoading = false;
  late File _pickedImage;

  void _saveForm() async {
    if (!_formKey.currentState!.validate()) {
      // INVALID
      setState(() {
        _isLoading = false;
      });
      print("INVALID");
      if (userData.images.length < 2) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Select at Least 2 images'),
          backgroundColor: Theme.of(context).errorColor,
        ));
      }
      return;
    }
    if (userData.images.length < 2) {
      // INVALID
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Select at Least 2 images'),
        backgroundColor: Theme.of(context).errorColor,
      ));
      print("INVALID");
      return;
    }
    try {
      _formKey.currentState!.save();

      print(userData.name);
      print(userData.age);
      print(userData.gender);
      print(userData.bio);
      print(userData.hobbies[0]);
      for (int i = 0; i < userData.images.length; i++) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child(
                FirebaseAuth.instance.currentUser!.uid + i.toString() + '.jpg');
        await ref.putFile(userData.images[i]).whenComplete(() => null);
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        //'images': _userData.images,
        'name': userData.name,
        'age': userData.age,
        'gender': userData.gender,
        'bio': userData.bio,
        'hobbies': userData.hobbies,
        'uid': userData.uid,
      });
      print("COMPLETED");
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

  void _pickImage() async {
    final pickedImageFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
    });
    userData.images.add(_pickedImage);
    print(userData.images.length);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.dimen_12,
          vertical: Sizes.dimen_16,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                height: Sizes.dimen_60,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: userData.images.length,
                    itemBuilder: (context, idx) {
                      return CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 40,
                        backgroundImage: FileImage(userData.images[idx]),
                      );
                    }),
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Add Image'),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(20, 20)),
                  // backgroundColor:
                  //     MaterialStateProperty.all(Colors.orange.shade400),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value';
                  }
                  return null;
                },
                onSaved: (value) {
                  userData.name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty || int.parse(value) < 18) {
                    return 'Age should be greater than equal to 18';
                  }
                  return null;
                },
                onSaved: (value) {
                  int temp = int.parse(value!);
                  userData.age = temp;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Gender'),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value';
                  }
                  return null;
                },
                onSaved: (value) {
                  userData.gender = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Bio'),
                //textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value!.length < 30) {
                    return 'Bio should be at least 30 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  print(value);
                  userData.bio = value!;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Add Interests'),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                controller: controller,
                onSubmitted: (value) {
                  userData.hobbies.add(value);
                  controller.clear();
                  setState(() {});
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.w),
                child: Container(
                  height: Sizes.dimen_60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: userData.hobbies.length,
                      itemBuilder: (context, idx) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.dimen_4.w),
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(vertical: Sizes.dimen_4.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: Sizes.dimen_8.w,
                                vertical: Sizes.dimen_4.w),
                            decoration: BoxDecoration(
                                color: AppColors.lightAppColorList[idx % 3],
                                borderRadius:
                                    BorderRadius.circular(Sizes.dimen_16.w),
                                border: Border.all(
                                    width: 1,
                                    color:
                                        AppColors.mediumAppColorList[idx % 3])),
                            child: Text(
                              userData.hobbies[idx],
                            ),
                          ),
                        );
                        // Card(
                        //   child: Text(_userData.hobbies[idx]),
                        // );
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: deviceSize.width * 0.7,
                  height: deviceSize.height * 0.07,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.dimen_10),
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : () => _saveForm(),
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
        ),
      ),
    );
  }
}
