
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/TechBlog.dart';

import '../../BlogShowPage/TechBlogShowPage.dart';
import '../BlogPage.dart';
import 'BlogCard.dart';

class TechBlogScrollWithArrows extends StatefulWidget {
  final List<FoodBlog> blogPosts;

  const TechBlogScrollWithArrows({required this.blogPosts, Key? key}) : super(key: key);

  @override
  _TechBlogScrollWithArrowsState createState() => _TechBlogScrollWithArrowsState();
}

class _TechBlogScrollWithArrowsState extends State<TechBlogScrollWithArrows> {
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
              children: widget.blogPosts.map((TechblogPost) {
                return BlogCard(
                  image: TechblogPost.Foodimage ?? "https://via.placeholder.com/150",
                  title: TechblogPost.Foodtitle ?? "No Title",
                  description: TechblogPost.Fooddescription ?? "No Description Available",
                  date: TechblogPost.Fooddate ?? "Unknown Date",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TechBlogShowPage(blog: TechblogPost),
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