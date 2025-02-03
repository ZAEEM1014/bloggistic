import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String date;
  final VoidCallback onPress;

  const BlogCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.date,
    required this.onPress,
  }) : super(key: key);

  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  double _elevation = 4.0;
  double _scale = 1.0;
  double _height = 270; // Add this to control the container size

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _elevation = 8.0;
          _scale = 1.05;
          _height = 290; // Increase height for animation
        });
      },
      onExit: (_) {
        setState(() {
          _elevation = 4.0;
          _scale = 1.0;
          _height = 270; // Reset height
        });
      },
      child: GestureDetector(
        onTap: widget.onPress,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(8.0),
          width: 250,
          height: _height, // Use the animated height
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: _elevation,
              ),
            ],
          ),
          child: Transform.scale(
            scale: _scale,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    widget.image,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.date,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}