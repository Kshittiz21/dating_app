import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/common/screen_util/screen_util.dart';
import 'package:dating_app/domain/entities/test_data.dart';
import 'package:dating_app/common/extensions/size_extensions.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/themes/app_colors.dart';
import 'package:dating_app/presentation/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final UserModel userModel;
  DetailScreen({Key? key, required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: Sizes.dimen_350.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_30.w),
                child: Image.asset(
                  "assets/images/anushka_sharma.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: Sizes.dimen_300.w,
              left: Sizes.dimen_140.w,
              child: Container(
                child: CustomIcon(
                  backGroundColor: Color(0xffF858A4),
                  iconColor: Colors.white,
                  iconSize: Sizes.dimen_60.w,
                  iconData: Icons.favorite,
                  onTap: () {},
                ),
              ),
            ),
            Positioned(
              top: Sizes.dimen_400.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${userModel.name}, ${userModel.age}",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "${userModel.gender}",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: Sizes.dimen_20.w),
                    ),
                    SizedBox(
                      height: Sizes.dimen_10.w,
                    ),
                    Text(
                      "About",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Container(
                      width: Sizes.dimen_300.w,
                      child: Text(
                        "${userModel.bio}",
                        maxLines: 5,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    SizedBox(
                      height: Sizes.dimen_10.w,
                    ),
                    Text(
                      "Interest",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Container(
                      width: Sizes.dimen_300.w,
                      child: Wrap(
                        spacing: Sizes.dimen_10.w,
                        children: [
                          for (int i = 0; i < userModel.hobbies.length; i++)
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: Sizes.dimen_4.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.dimen_8.w,
                                  vertical: Sizes.dimen_4.w),
                              decoration: BoxDecoration(
                                  color: AppColors.lightAppColorList[i % 3],
                                  borderRadius:
                                      BorderRadius.circular(Sizes.dimen_16.w),
                                  border: Border.all(
                                      width: 1,
                                      color:
                                          AppColors.mediumAppColorList[i % 3])),
                              child: Text(
                                userModel.hobbies[i],
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
