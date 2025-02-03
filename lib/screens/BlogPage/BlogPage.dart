import 'package:bloggistic/constants.dart';
import 'package:bloggistic/models/LifeStyleBlog.dart';
import 'package:bloggistic/models/TechBlog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/FoodBlog.dart';
import '../components/categories.dart';
import '../components/navbar.dart';
import '../components/recentpostcard.dart';
import 'component/FoodBlogScrollWithArrows.dart';
import 'component/LifeStyleBlogScrollWithArrows.dart';
import 'component/TechBlogScrollWithArrows.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20), // Adjust duration as needed
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          NavBar(controller: _controller),
          Expanded(
            child: Row(
              children: [
                // Sidebar Section (Search, Categories, Recent Posts)
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            // Search Container
                            Container(
                              margin: const EdgeInsets.only(
                                  left: kDefaultPadding,
                                  right: kDefaultPadding,
                                  bottom: kDefaultPadding / 2,
                                  top: kDefaultPadding),
                              padding: const EdgeInsets.all(kDefaultPadding),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(kDefaultPadding / 4))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Search",
                                    style: TextStyle(
                                        color: kDarkBlackColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: kDefaultPadding / 4),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Type Here",
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(kDefaultPadding / 2),
                                        child: SvgPicture.asset("assets/icons/feather_search.svg"),
                                      ),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding / 2)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Categories Container
                            Container(
                              margin: const EdgeInsets.only(
                                  left: kDefaultPadding,
                                  right: kDefaultPadding,
                                  bottom: kDefaultPadding / 2,
                                  top: 0),
                              padding: const EdgeInsets.all(kDefaultPadding),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding / 4))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Categories",
                                    style: TextStyle(color: kDarkBlackColor, fontWeight: FontWeight.w600),
                                  ),
                                  Category(title: "Technology", numOfItems: 3, press: () {}),
                                  Category(title: "LifeStyle", numOfItems: 4, press: () {}),
                                  Category(title: "Finance", numOfItems: 5, press: () {}),
                                  Category(title: "Education", numOfItems: 2, press: () {}),
                                  Category(title: "Food", numOfItems: 2, press: () {}),
                                  Category(title: "Business", numOfItems: 2, press: () {}),
                                ],
                              ),
                            ),
                            // Recent Posts Container
                            Container(
                              margin: const EdgeInsets.only(
                                  left: kDefaultPadding,
                                  right: kDefaultPadding,
                                  bottom: kDefaultPadding,
                                  top: 0),
                              padding: const EdgeInsets.all(kDefaultPadding),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding / 4))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Recent Posts",
                                    style: TextStyle(color: kDarkBlackColor, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: kDefaultPadding / 4),
                                  RecentPostCard(image: "assets/images/recent_1.png", title: "Our secret formula for online store", press: () {}),
                                  RecentPostCard(image: "assets/images/recent_2.png", title: "Let grow our business", press: () {}),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Blog Content Section (Tech and Lifestyle Blogs)
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TechBlogScrollWithArrows(blogPosts: TechblogPosts),
                        LifeStyleBlogScrollWithArrows(blogPosts: LifeStyleblogPosts),
                        FoodBlogScrollWithArrows(blogPosts: FoodblogPosts)

                      ],
                    ),
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
