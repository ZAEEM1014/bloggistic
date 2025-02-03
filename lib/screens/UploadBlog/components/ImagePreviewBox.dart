import 'package:flutter/material.dart';
import 'dart:typed_data';

class ImagePreviewBox extends StatelessWidget {
  final Uint8List? selectedImageBytes;

  const ImagePreviewBox({Key? key, this.selectedImageBytes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: selectedImageBytes == null
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_a_photo,
            size: 40,
            color: Colors.grey[500],
          ),
          const SizedBox(height: 5),
          const Text(
            "Add Cover Image",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      )
          : ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.memory(
          selectedImageBytes!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 150,
        ),
      ),
    );
  }
}