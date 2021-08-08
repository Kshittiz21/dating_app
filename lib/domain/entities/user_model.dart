import 'dart:io';

import 'package:dating_app/common/constants/image_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel extends Equatable with ChangeNotifier {
  late String bio, name, gender;
  late String? email;
  late List<File> images;
  late List<String> hobbies;
  late int age;
  List<UserModel> likedUserList;

  void addLikedUser(UserModel userModel) {
    if (!likedUserList.contains(userModel)) likedUserList.add(userModel);
    print(likedUserList.length);
    notifyListeners();
  }

  bool isFavourtie(UserModel userModel) {
    return likedUserList.contains(userModel);
  }

  void removeLikedUser(UserModel userModel) {
    likedUserList.remove(userModel);
    print(likedUserList.length);
    notifyListeners();
  }

  void updateEmail(String? email) {
    this.email = email;
    notifyListeners();
  }

  UserModel({
    required this.images,
    required this.name,
    required this.gender,
    required this.age,
    required this.bio,
    required this.hobbies,
    required this.likedUserList,
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

List<UserModel> users = [
  UserModel(
    images: [],
    name: 'Akshay Kumar',
    gender: 'Male',
    age: 32,
    bio:
        'Rajiv Hari Om Bhatia, known professionally as Akshay Kumar, is an Indian-born naturalised Canadian actor, film producer, martial artist and television personality who works in Bollywood, the commercial Hindi language film industry based chiefly in Mumbai.',
    hobbies: [
      'drwaing',
      'Music',
      'Reading',
      'Dancing',
      'Sports',
    ],
    likedUserList: [],
    email: null,
  ),
  UserModel(
    images: [],
    name: 'Shruti haasan',
    gender: 'Female',
    age: 28,
    bio:
        'Shruti Haasan is an Indian actress who works predominantly in Telugu, Tamil and Hindi language films. Born in the Haasan family, she is the daughter of actors Kamal Haasan and Sarika Thakur.',
    hobbies: [
      'drwaing',
      'Music',
      'Reading',
      'Dancing',
      'Sports',
    ],
    likedUserList: [],
    email: null,
  ),
  UserModel(
    images: [],
    name: 'Deepika',
    gender: 'Female',
    age: 28,
    bio:
        'Deepika Padukone is an Indian actress and producer who works in Hindi films. One of the highest-paid actresses in India, her accolades include three Filmfare Awards. She features in listings of the nation\'s most popular personalities, and Time named her one of the 100 most influential people in the world in 2018.',
    hobbies: [
      'drwaing',
      'Music',
      'Reading',
      'Dancing',
      'Sports',
    ],
    likedUserList: [],
    email: null,
  ),
  UserModel(
    images: [],
    name: 'Kriti Kharbanda',
    gender: 'Female',
    age: 28,
    bio:
        'Kriti Kharbanda is an Indian actress and model known for her work predominantly in Kannada, Hindi, and Telugu language films. She has received accolades including a SIIMA Award and two nominations for the Filmfare Award South.',
    hobbies: [
      'drwaing',
      'Music',
      'Reading',
      'Dancing',
      'Sports',
    ],
    likedUserList: [],
    email: null,
  ),
  UserModel(
    images: [],
    name: 'Alia Bhatt',
    gender: 'Female',
    age: 24,
    bio:
        'Alia Bhatt is a British-Indian actress and singer who works in Hindi-language films. Her accolades include four Filmfare Awards. She has appeared in Forbes India\'s Celebrity 100 list since 2014 and was featured by Forbes Asia in their 30 Under 30 list of 2017.',
    hobbies: [
      'drwaing',
      'Music',
      'Reading',
      'Dancing',
      'Sports',
    ],
    likedUserList: [],
    email: null,
  ),
  UserModel(
    images: [],
    name: 'Madhuri Dixit',
    gender: 'Female',
    age: 36,
    bio:
        'Madhuri Dixit Nene is an Indian actress, producer and television personality. One of the most popular actresses of Hindi cinema, she has appeared in over 70 Bollywood films.',
    hobbies: [
      'drwaing',
      'Music',
      'Reading',
      'Dancing',
      'Sports',
    ],
    likedUserList: [],
    email: null,
  ),
];
