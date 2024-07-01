import 'package:flutter/material.dart';

class Road extends StatefulWidget {
  const Road({super.key});

  @override
  State<Road> createState() => _RoadState();
}

class _RoadState extends State<Road> with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 160,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
    _animationController.forward();
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (ctx, child) {
        List<Widget> positions = [];
        for (int i = 0; i < 10; i++) {
          positions.add(
            Positioned(
              right: _animation.value - (i * 20),
              top: 35,
              child: Container(
                height: 5,
                width: 10,
                color: Colors.black,
              ),
            ),
          );
        }
        return Flexible(
          child: Stack(
            children: positions,
          ),
        );
      },
    );
  }
}
