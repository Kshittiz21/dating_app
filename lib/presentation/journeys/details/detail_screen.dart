import 'package:dating_app/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/anushka_sharma.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIcon(
                      backGroundColor: Colors.white,
                      iconColor: Colors.red.shade300,
                      iconSize: 40,
                      iconData: Icons.cancel_rounded,
                    ),
                    CustomIcon(
                      backGroundColor: Colors.red.shade100,
                      iconColor: Colors.red.shade500,
                      iconSize: 70,
                      iconData: Icons.favorite,
                    ),
                    CustomIcon(
                      backGroundColor: Colors.white,
                      iconColor: Colors.purple.shade300,
                      iconSize: 40,
                      iconData: Icons.star,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
