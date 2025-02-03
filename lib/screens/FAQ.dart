import 'package:bloggistic/constants.dart';
import 'package:bloggistic/screens/components/navbar.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> with TickerProviderStateMixin {
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: kDarkBlackColor,
            child: SafeArea(
              child: Column(
                children: [
                  NavBar(controller: _controller), // Pass the controller here
                ],
              ),
            ),
          ),
          // Add more content for FAQ page below as needed
        ],
      ),
    );
  }
}
