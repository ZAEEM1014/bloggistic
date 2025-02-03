



import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class RecentPostCard extends StatelessWidget {
  final String image,title;
  final VoidCallback press;
  const RecentPostCard({
    super.key,
    required this.image,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(
                    image)),
            const SizedBox(width: kDefaultPadding,),
            Expanded(
              flex: 5,
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                    color: kDarkBlackColor,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    fontFamily: "Raleway"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
