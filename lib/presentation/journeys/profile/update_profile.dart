import 'dart:io';

import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/domain/entities/user_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

var userData = UserModel(
  images: [],
  name: '',
  gender: '',
  age: 18,
  bio: '',
  hobbies: [],
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

  void _saveForm() {
    if (!_formKey.currentState!.validate() || userData.images.length < 2) {
      // INVALID
      setState(() {
        _isLoading = false;
      });
      print("INVALID");
      return;
    }
    _formKey.currentState!.save();
    // _userData.name = initData['name'].toString();
    // _userData.age = int.parse(initData['age']);
    // _userData.gender = initData['gender'].toString();
    // _userData.bio = initData['bio'].toString();
    print(userData.name);
    print(userData.age);
    print(userData.gender);
    print(userData.bio);
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
      body: Form(
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please provide a value';
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
              controller: controller,
              onSubmitted: (value) {
                userData.hobbies.add(value);
                controller.clear();
              },
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('Add Hobbies'),
            //   style: ButtonStyle(
            //     fixedSize: MaterialStateProperty.all(Size(20, 20)),
            //     // backgroundColor:
            //     //     MaterialStateProperty.all(Colors.orange.shade400),
            //   ),
            // ),
            Container(
              height: Sizes.dimen_60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userData.hobbies.length,
                  itemBuilder: (context, idx) {
                    return Card(
                      child: Text(userData.hobbies[idx]),
                    );
                  }),
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
    );
  }
}
