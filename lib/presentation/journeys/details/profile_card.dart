import 'package:dating_app/common/constants/size_constants.dart';
import 'package:dating_app/domain/entities/test_data.dart';
import 'package:dating_app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/common/extensions/size_extensions.dart';

class ProfileCard extends StatelessWidget {
  final TestData profile;
  const ProfileCard({Key? key, required this.profile}) : super(key: key);

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
                "assets/images/anushka_sharma.jpg",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),
          ),
          Positioned(
              // right: Sizes.dimen_12,
              bottom: 26,
              child: Container(
                  color: Colors.white70,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                        CustomIcon(
                          backGroundColor: Colors.white10,
                          iconColor: Colors.red,
                          iconSize: 20,
                          iconData: Icons.favorite,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ))

              // InkWell(
              //   onTap: () {
              //     // BlocProvider.of<FavouriteMovieBloc>(context)
              //     //     .add(DeleteFavouriteMovieEvent(movieId: movieEntity.id));
              //   },
              //   child: Icon(
              //     Icons.delete,
              //     color: Colors.white,
              //   ),
              // )
              ),
        ],
      ),
    );
  }
}
