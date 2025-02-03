import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/components/footer.dart';
import 'components/navbar.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  final ScrollController _scrollController = ScrollController();
  bool _showFooter = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20), // Duration for color transition
    );

    // Add a listener to detect when the user scrolls to the bottom
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          _showFooter = true; // Show the footer when the user scrolls to the bottom
        });
      } else {
        setState(() {
          _showFooter = false; // Hide the footer when the user scrolls up
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Pass the controller to NavBar for color transition
          NavBar(controller: _controller),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About Us',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Welcome to Bloggistic! We are a passionate community of bloggers, writers, and creatives committed to sharing unique stories, helpful advice, and valuable insights across various topics.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Our Mission:',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'At Bloggistic, our mission is simple: to provide a platform where people can share their experiences, ideas, and perspectives on topics that matter to them. Whether you are a seasoned writer or a new blogger, we offer resources, inspiration, and a community to support your creative journey.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Why Blog?',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Blogging allows individuals to express their ideas and creativity, establish authority in their niche, and connect with like-minded people. Whether you\'re writing about personal experiences, sharing your expertise, or discussing trending topics, blogging provides a unique way to influence others and contribute to the digital world.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Our Vision:',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'We envision Bloggistic as a thriving community where bloggers can collaborate, inspire, and learn from each other. Our platform is designed to nurture creativity and empower individuals to share their stories with the world.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Optional: You can include an image or logo here
                            Center(
                              child: SvgPicture.asset(
                                "assets/icons/blog-logo.svg", // Replace with your logo
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container(
                      child: SvgPicture.asset(
                        "assets/images/teamwork.svg",
                        placeholderBuilder: (BuildContext context) => Center(
                          child: CircularProgressIndicator(),
                        ),

                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
          // Show Footer only when _showFooter is true
          if (_showFooter) Footer(controller: _controller),
        ],
      ),
    );
  }
}