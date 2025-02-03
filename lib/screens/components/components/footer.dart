import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final AnimationController controller;

  const Footer({super.key, required this.controller});

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  late Animation<Color?> _colorAnimation;

  // Define a list of colors to transition through (same as Navbar)
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
          padding: const EdgeInsets.all(20),
          color: _colorAnimation.value, // Animated background color
          child: Column(
            children: [
              Text(
                "Bloggistic Footer",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "© 2025 Bloggistic. All Rights Reserved.",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
