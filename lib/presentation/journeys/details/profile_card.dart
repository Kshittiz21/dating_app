import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/domain/entities/test_data.dart';
import 'package:dating_app/domain/entities/user_model.dart';
import 'package:dating_app/presentation/widgets/custom_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/common/extensions/size_extensions.dart';

class ProfileCard extends StatelessWidget {
  final UserModel profile;

  const ProfileCard({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_12),
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                "${profile.imageUrl[0]}",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),
          ),
          Positioned(
              bottom: 26,
              child: Container(
                  width: Sizes.dimen_150.w,
                  color: Colors.white70,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_14, vertical: Sizes.dimen_2),
                    child: Row(
                      children: [
                        Text(
                          "${profile.name}",
                          overflow: TextOverflow.fade,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        CustomIcon(
                          backGroundColor: Colors.white10,
                          iconColor: Colors.red,
                          iconSize: 20,
                          iconData: Icons.favorite,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }
}
