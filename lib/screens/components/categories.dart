



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Category extends StatelessWidget {
  final String title;
  final int numOfItems;
  final VoidCallback press;
  const Category({

    super.key,
    required this.title,
    required this.numOfItems,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextButton(onPressed:(){},
            child: Text.rich(TextSpan(
                text: title,
                style: TextStyle(color: kDarkBlackColor),
                children: [
                  TextSpan(
                    text: "($numOfItems)",
                    style: TextStyle(color: kDarkBlackColor,fontWeight: FontWeight.w500)
                    ,
                  )
                ]
            ))
        ),
      ],
    );
  }
}
