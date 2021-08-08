import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/journeys/details/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  final UserModel userModel;
  final List<UserModel> users;
  const FeedScreen({Key? key, required this.userModel, required this.users})
      : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  void addToFavorite(
      UserModel likedProfile, BuildContext context, bool isFavourite) {
    if (isFavourite)
      widget.userModel.addLikedUser(likedProfile);
    else
      widget.userModel.removeLikedUser(likedProfile);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        bool isFavourite = widget.userModel.isFavourtie(widget.users[index]);

        return DetailScreen(
          userModel: widget.users[index],
          onTap: addToFavorite,
          isFavourite: isFavourite,
        );
      },
      itemCount: widget.users.length,
      physics: ClampingScrollPhysics(),
      pageSnapping: true,
    );
  }
}
