import 'package:bloggistic/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/mainscreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: kDarkBlackColor,
            child: const SafeArea(
              child: Column(
                children: [
                  Header(
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


