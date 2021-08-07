import 'dart:io';

import 'package:flutter/material.dart';

class UserModel {
  late String bio,name, gender;
  late List<File> images;
  late List<String> hobbies;
  late int age;

  UserModel({
    required this.images,
    required this.name,
    required this.gender,
    required this.age,
    required this.bio,
    required this.hobbies,
  });
}
