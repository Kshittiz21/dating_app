import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class UserData extends Equatable with ChangeNotifier {
  String? email;
  String? displayName;

  // UserData({required this.email, required this.displayName});

  void updateUserData(String? email, String? displayName) {
    this.email = email;
    this.displayName = displayName;
    notifyListeners();
  }

  @override
  List<Object?> get props => [email, displayName];
}
