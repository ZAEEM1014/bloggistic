
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/LifeStyleBlog.dart';
import '../../BlogShowPage/LifeStyleBlogShowPage.dart';
import 'BlogCard.dart';

class LifeStyleBlogScrollWithArrows extends StatefulWidget {
  final List<FoodBlog> blogPosts;

  const LifeStyleBlogScrollWithArrows({required this.blogPosts, Key? key}) : super(key: key);

  @override
  _LifeStyleBlogScrollWithArrowsState createState() => _LifeStyleBlogScrollWithArrowsState();
}

class _LifeStyleBlogScrollWithArrowsState extends State<LifeStyleBlogScrollWithArrows> {
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
              children: widget.blogPosts.map((LifeStyleblogPost) {
                return BlogCard(
                  image: LifeStyleblogPost.Foodimage?? "https://via.placeholder.com/150",
                  title: LifeStyleblogPost.Foodtitle ?? "No Title",
                  description: LifeStyleblogPost.Fooddescription ?? "No Description Available",
                  date: LifeStyleblogPost.Fooddate ?? "Unknown Date",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodBlogShowPage(blog: LifeStyleblogPost),
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