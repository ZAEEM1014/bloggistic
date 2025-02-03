
import 'package:bloggistic/screens/components/social.dart';
import 'package:bloggistic/screens/components/web_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../components/components/social.dart';
import '../../components/components/web_menu.dart';
import '../../constants.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  // Define a list of colors to transition through
  final List<Color> _colors = [
    Colors.black,
    Colors.deepPurple,


  ];

  int _currentColorIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _updateColorTween();
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
        _updateColorTween();
        _controller.forward(from: 0); // Restart the animation
      }
    });
  }

  void _updateColorTween() {
    final nextIndex = (_currentColorIndex + 1) % _colors.length;
    _colorAnimation = ColorTween(
      begin: _colors[_currentColorIndex],
      end: _colors[nextIndex],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height, // Cover the whole page height
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding,
          ),
          color: _colorAnimation.value, // Background color transition
          child: Column(
            children: [
              Row(
                children: [
                  AnimatedOpacity(
                    opacity: 1.0, // Fade-in animation for the logo
                    duration: const Duration(seconds: 2),
                    child: SvgPicture.asset("assets/icons/logo.svg"),
                  ),
                  const Spacer(),
                  WebMenu(),
                  const Spacer(),

                  const Social(),
                ],
              ),
              const SizedBox(
                height: kDefaultPadding * 2,
              ),
              AnimatedDefaultTextStyle(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
                duration: const Duration(seconds: 1),
                child: const Text("Welcome to Our Blogs"),
              ),
              const Text(
                'Uncover new ideas, dive into insightful knowledge, and ignite your creative spark—your journey into the world of blogging begins here,\n where inspiration and endless possibilities await.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              SvgPicture.asset("assets/images/cooz.svg" )
            ],
          ),
        );
      },
    );
  }
}// TODO Implement this library.