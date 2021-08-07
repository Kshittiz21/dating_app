import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/common/screen_util/screen_util.dart';
import 'package:dating_app/domain/entities/test_data.dart';
import 'package:dating_app/presentation/journeys/details/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/common/extensions/size_extensions.dart';

class LikedProfileScreen extends StatelessWidget {
  LikedProfileScreen({Key? key}) : super(key: key);
  final List<TestData> testData = [
    TestData(
      name: "Anushka Sharma",
      age: "24",
      occupation: "Actress",
      imagePath: "",
      about: "xyz",
      intrest: ["cricket", "movies"],
    ),
    TestData(
      name: "Anushka Sharma",
      age: "24",
      occupation: "Actress",
      imagePath: "",
      about: "xyz",
      intrest: ["cricket", "movies"],
    ),
    TestData(
      name: "Anushka Sharma",
      age: "24",
      occupation: "Actress",
      imagePath: "",
      about: "xyz",
      intrest: ["cricket", "movies"],
    ),
    TestData(
      name: "Anushka Sharma",
      age: "24",
      occupation: "Actress",
      imagePath: "",
      about: "xyz",
      intrest: ["cricket", "movies"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return
        // Scaffold(
        //   body:
        Container(
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
            itemCount: testData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.dimen_16.w,
              mainAxisSpacing: Sizes.dimen_8.w,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return ProfileCard(
                profile: testData[index],
              );
            },
          ),
        ],
      ),
      // ),
    );
  }
}
