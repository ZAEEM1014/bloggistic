import 'package:bloggistic/screens/components/social.dart';
import 'package:bloggistic/screens/components/web_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants.dart';

class NavBar extends StatefulWidget {
  final AnimationController controller;

  const NavBar({super.key, required this.controller});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
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
    _updateColorTween();
    widget.controller.forward();

    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
        _updateColorTween();
        widget.controller.forward(from: 0); // Restart the animation
      }
    });
  }

  void _updateColorTween() {
    final nextIndex = (_currentColorIndex + 1) % _colors.length;
    _colorAnimation = ColorTween(
      begin: _colors[_currentColorIndex],
      end: _colors[nextIndex],
    ).animate(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2,
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
            ],
          ),
        );
      },
    );
  }
}
