import 'package:flutter/material.dart';
class EditorToolbar extends StatelessWidget {
  final bool isBold;
  final bool isItalic;
  final bool isUnderlined;
  final VoidCallback onBoldPressed;
  final VoidCallback onItalicPressed;
  final VoidCallback onUnderlinedPressed;
  final VoidCallback onImagePressed;
  final VoidCallback onTextColorPressed;
  final VoidCallback onBackgroundColorPressed;
  final VoidCallback onFontPressed;
  final VoidCallback onFontSizePressed;

  const EditorToolbar({
    Key? key,
    required this.isBold,
    required this.isItalic,
    required this.isUnderlined,
    required this.onBoldPressed,
    required this.onItalicPressed,
    required this.onUnderlinedPressed,
    required this.onImagePressed,
    required this.onTextColorPressed,
    required this.onBackgroundColorPressed,
    required this.onFontPressed,
    required this.onFontSizePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.format_bold,
              color: isBold ? Colors.blue : Colors.black,
            ),
            onPressed: onBoldPressed,
          ),
          IconButton(
            icon: Icon(
              Icons.format_italic,
              color: isItalic ? Colors.blue : Colors.black,
            ),
            onPressed: onItalicPressed,
          ),
          IconButton(
            icon: Icon(
              Icons.format_underlined,
              color: isUnderlined ? Colors.blue : Colors.black,
            ),
            onPressed: onUnderlinedPressed,
          ),
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: onImagePressed,
          ),
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: onTextColorPressed,
          ),
          IconButton(
            icon: const Icon(Icons.format_color_fill),
            onPressed: onBackgroundColorPressed,
          ),
          IconButton(
            icon: const Icon(Icons.font_download),
            onPressed: onFontPressed,
          ),
          IconButton(
            icon: const Icon(Icons.text_fields),
            onPressed: onFontSizePressed,
          ),
        ],
      ),
    );
  }
}