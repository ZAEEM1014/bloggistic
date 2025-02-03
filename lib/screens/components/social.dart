


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

import '../UploadBlog/uploadBlog.dart';

class Social extends StatelessWidget {
  const Social({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/behance-alt.svg"),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2),
          child: SvgPicture.asset(
              "assets/icons/feather_dribbble.svg"),
        ),
        SvgPicture.asset("assets/icons/feather_twitter.svg"),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UploadBlogPage(), // Navigate to UploadBlog page
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 1.5,
                  vertical:
                  kDefaultPadding), // Equal padding for a square-like shape
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8), // Slightly rounded corners
              ),
              backgroundColor:
              kPrimaryColor, // Optional: Set button background color
            ),
            child: const Text(
              "Let's Blog!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}