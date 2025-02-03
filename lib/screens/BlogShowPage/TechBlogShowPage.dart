import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/TechBlog.dart';


class TechBlogShowPage extends StatelessWidget {
  final FoodBlog blog;

  const TechBlogShowPage({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Responsive Image Container
              Container(
                width: screenWidth, // Set width to the screen width
                height: 400, // Adjust the height as per your design
                child: Image.network(
                  blog.Foodimage ?? "https://via.placeholder.com/150",
                  fit: BoxFit.cover, // Makes the image cover the container
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  blog.Foodtitle ?? "No Title",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  blog.Fooddescription ?? "No Description",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                blog.Fooddate ?? "Unknown Date",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
