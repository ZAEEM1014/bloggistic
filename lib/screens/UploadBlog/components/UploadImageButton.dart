import 'package:flutter/material.dart';

import '../../../constants.dart';

class UploadCoverImageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const UploadCoverImageButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.3,
            vertical: kDefaultPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: kPrimaryColor,
        ),
        onPressed: onPressed,
        icon: const Icon(Icons.upload, color: Colors.white),
        label: const Text(
          'Upload Cover Image',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}