import 'package:dating_app/common/constants/image_constants.dart';
import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/common/screen_util/screen_util.dart';
import 'package:dating_app/domain/entities/test_data.dart';
import 'package:dating_app/common/extensions/size_extensions.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/journeys/auth/auth_google/google_auth.dart';
import 'package:dating_app/presentation/themes/app_colors.dart';
import 'package:dating_app/presentation/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  final UserModel userModel;

  UserProfile({Key? key, required this.userModel}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
              width: Sizes.dimen_360.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_30.w),
                child: Image.asset(
                  "${widget.userModel.imageUrl[0]}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: Sizes.dimen_320.w,
              left: Sizes.dimen_140.w,
              child: Container(
                child: CustomIcon(
                  backGroundColor: Color(0xffF858A4),
                  iconColor: Colors.white,
                  iconSize: Sizes.dimen_40.w,
                  iconData: Icons.logout,
                  onTap: () {
                    Provider.of<GoogleAuth>(context, listen: false)
                        .logout(context);
                  },
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
                      "${widget.userModel.name}, ${widget.userModel.age}",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "${widget.userModel.gender}",
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
                        "${widget.userModel.bio}",
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
                          for (int i = 0;
                              i < widget.userModel.hobbies.length;
                              i++)
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
                                widget.userModel.hobbies[i],
                              ),
                            ),
                        ],
                      ),
                    ),
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
