
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../../../models/FoodBlog.dart';
import '../../BlogShowPage/FoodBlogShowPage.dart';
import 'BlogCard.dart';

class FoodBlogScrollWithArrows extends StatefulWidget {
  final List<FoodBlog> blogPosts;

  const FoodBlogScrollWithArrows({required this.blogPosts, Key? key}) : super(key: key);

  @override
  _FoodBlogScrollWithArrowsState createState() => _FoodBlogScrollWithArrowsState();
}

class _FoodBlogScrollWithArrowsState extends State<FoodBlogScrollWithArrows> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: _scrollLeft,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Row(
              children: widget.blogPosts.map((FoodblogPost) {
                return BlogCard(
                  image: FoodblogPost.Foodimage?? "https://via.placeholder.com/150",
                  title: FoodblogPost.Foodtitle ?? "No Title",
                  description: FoodblogPost.Fooddescription ?? "No Description Available",
                  date: FoodblogPost.Fooddate ?? "Unknown Date",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodBlogShowPage(blog: FoodblogPost),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: _scrollRight,
        ),
      ],
    );
  }
}