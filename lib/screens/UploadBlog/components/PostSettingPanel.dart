import 'package:flutter/material.dart';

class PostSettings extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String?> onCategoryChanged;
  final Widget imagePreviewBox;
  final Widget uploadCoverImageButton;

  const PostSettings({
    Key? key,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.imagePreviewBox,
    required this.uploadCoverImageButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Post Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text('Category'),
        const SizedBox(height: 10),
        DropdownButton<String>(
          isExpanded: true,
          value: selectedCategory,
          items: <String>[
            'Select',
            'Technology',
            'Lifestyle',
            'Finance',
            'Education',
            'Food',
            'Business'
          ].map((category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: onCategoryChanged,
        ),
        const SizedBox(height: 20),
        const Text('Date'),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Date',
          ),
        ),
        const SizedBox(height: 20),
        const Text('Cover Image'),
        const SizedBox(height: 10),
        imagePreviewBox,
        const SizedBox(height: 10),
        uploadCoverImageButton,
      ],
    );
  }
}