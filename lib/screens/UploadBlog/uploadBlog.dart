import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';
import '../components/navbar.dart';
import 'components/EditorToolbar.dart';
import 'components/ImagePreviewBox.dart';
import 'components/PostSettingPanel.dart';
import 'components/UploadImageButton.dart';

// FoodBlog Model
class FoodBlog {
  final String? Fooddate, Foodtitle, Fooddescription, Foodimage;

  FoodBlog({this.Fooddate, this.Foodtitle, this.Fooddescription, this.Foodimage});
}

// FoodblogPosts List
List<FoodBlog> FoodblogPosts = [];

class UploadBlogPage extends StatefulWidget {
  const UploadBlogPage({Key? key}) : super(key: key);

  @override
  _UploadBlogPageState createState() => _UploadBlogPageState();
}

class _UploadBlogPageState extends State<UploadBlogPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  // Controllers for form fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // Style properties
  bool _isBold = false;
  bool _isItalic = false;
  bool _isUnderlined = false;
  String _selectedFont = 'Arial';
  double _fontSize = 14.0;
  TextAlign _textAlign = TextAlign.left;
  Color _textColor = Colors.black;
  Color _backgroundColor = Colors.transparent;

  // Blog settings
  String _selectedCategory = 'Select';
  Uint8List? _selectedImageBytes;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  TextStyle _applyTextStyle() {
    return TextStyle(
      fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
      decoration: _isUnderlined ? TextDecoration.underline : TextDecoration.none,
      fontFamily: _selectedFont,
      fontSize: _fontSize,
      color: _textColor,
      backgroundColor: _backgroundColor,
    );
  }

  void _pickTextColor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick Text Color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: _textColor,
            onColorChanged: (color) {
              setState(() {
                _textColor = color;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _pickBackgroundColor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick Background Color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: _backgroundColor,
            onColorChanged: (color) {
              setState(() {
                _backgroundColor = color;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _selectCoverImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _selectedImageBytes = bytes;
      });
    }
  }

  void _pickFont() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick Font'),
        content: DropdownButton<String>(
          isExpanded: true,
          value: _selectedFont,
          items: <String>['Arial', 'Courier New', 'Times New Roman', 'Verdana']
              .map((font) {
            return DropdownMenuItem<String>(
              value: font,
              child: Text(font),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedFont = newValue!;
            });
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _pickFontSize() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick Font Size'),
        content: Slider(
          value: _fontSize,
          min: 8.0,
          max: 32.0,
          divisions: 24,
          label: _fontSize.toString(),
          onChanged: (newValue) {
            setState(() {
              _fontSize = newValue;
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _publishPost() {
    if (_selectedCategory == 'Food') {
      final newPost = FoodBlog(
        Fooddate: DateTime.now().toString(),
        Foodtitle: _titleController.text,
        Fooddescription: _contentController.text,
        Foodimage: _selectedImageBytes != null
            ? 'Image Selected' // You can handle image path here if you need
            : null,
      );

      setState(() {
        FoodblogPosts.add(newPost);
      });

      // Clear the input fields after publishing
      _titleController.clear();
      _contentController.clear();
      setState(() {
        _selectedImageBytes = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Blog Published Successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Navigation Bar
          Container(
            width: double.infinity,
            color: kDarkBlackColor,
            child: SafeArea(
              child: Column(
                children: [
                  NavBar(controller: _controller),
                ],
              ),
            ),
          ),

          // Main Content
          Expanded(
            child: Row(
              children: [
                // Sidebar for settings
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Preview Button
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding * 1.3,
                                    vertical: kDefaultPadding * 1.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Colors.grey),
                              ),
                              onPressed: () {
                                // Add Preview functionality
                              },
                              icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                              label: const Text(
                                'Preview',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),

                            // Publish Button
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding * 1.3,
                                    vertical: kDefaultPadding * 1.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: kPrimaryColor,
                              ),
                              onPressed: _publishPost,
                              icon: const Icon(Icons.play_arrow, color: Colors.white),
                              label: const Text(
                                'Publish',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),

                      PostSettings(
                        selectedCategory: _selectedCategory,
                        onCategoryChanged: (newValue) {
                          setState(() {
                            _selectedCategory = newValue!;
                          });
                        },
                        imagePreviewBox: ImagePreviewBox(selectedImageBytes: _selectedImageBytes),
                        uploadCoverImageButton: UploadCoverImageButton(onPressed: _selectCoverImage),
                      ),
                    ],
                  ),
                ),

                // Editor Section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            hintText: 'Title',
                            hintStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Divider(color: Colors.grey),
                        EditorToolbar(
                          isBold: _isBold,
                          isItalic: _isItalic,
                          isUnderlined: _isUnderlined,
                          onBoldPressed: () {
                            setState(() {
                              _isBold = !_isBold;
                            });
                          },
                          onItalicPressed: () {
                            setState(() {
                              _isItalic = !_isItalic;
                            });
                          },
                          onUnderlinedPressed: () {
                            setState(() {
                              _isUnderlined = !_isUnderlined;
                            });
                          },
                          onImagePressed: _selectCoverImage,
                          onTextColorPressed: _pickTextColor,
                          onBackgroundColorPressed: _pickBackgroundColor,
                          onFontPressed: _pickFont,
                          onFontSizePressed: _pickFontSize,
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: TextField(
                            controller: _contentController,
                            maxLines: null,
                            textAlign: _textAlign,
                            style: _applyTextStyle(),
                            decoration: const InputDecoration(
                              hintText: 'Start writing your blog...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
