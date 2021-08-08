import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/journeys/details/detail_screen.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  final UserModel userModel;
  final List<UserModel> users;
  const FeedScreen({Key? key, required this.userModel, required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return DetailScreen(userModel: users[index]);
      },
      itemCount: users.length,
      physics: ClampingScrollPhysics(),
      pageSnapping: true,
    );
  }
}
