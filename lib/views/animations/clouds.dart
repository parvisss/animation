import 'package:flutter/material.dart';

class Clouds extends StatefulWidget {
  const Clouds({super.key});

  @override
  State<Clouds> createState() => _CloudsState();
}

class _CloudsState extends State<Clouds> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _animation = Tween<double>(
      begin: -40,
      end: 80,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
    );
    animationController.forward();
    animationController.repeat();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (ctx, child) {
        return Flexible(
          child: Stack(
            children: [
              Positioned(
                right: _animation.value,
                top: 1,
                child: const Icon(
                  Icons.cloud_outlined,
                ),
              ),
              Positioned(
                top: 25,
                right: _animation.value - 20,
                child: const Icon(
                  Icons.cloud_outlined,
                ),
              ),
              Positioned(
                bottom: 0,
                right: _animation.value + 40,
                child: const Icon(
                  Icons.cloud_outlined,
                ),
              ),
              Positioned(
                bottom: 0,
                right: _animation.value - 60,
                child: const Icon(
                  Icons.cloud_outlined,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
