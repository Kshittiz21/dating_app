import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/domain/entities/test_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/journeys/details/profile_card.dart';
import 'package:dating_app/presentation/journeys/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/common/extensions/size_extensions.dart';

class LikedProfileScreen extends StatelessWidget {
  final UserModel userProfile;
  const LikedProfileScreen({Key? key, required this.userProfile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init();
    // print(userProfile.runtimeType);
    // print(userProfile.toString());
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_30.w, vertical: Sizes.dimen_10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Sizes.dimen_40.w,
          ),
          Text(
            "Mathces",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontSize: Sizes.dimen_30),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: testUser.likedUserList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.dimen_16.w,
              mainAxisSpacing: Sizes.dimen_8.w,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return ProfileCard(
                profile: testUser.likedUserList[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
