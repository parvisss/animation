import 'package:animation/models/animation_models.dart';
import 'package:flutter/cupertino.dart';

class Plane extends StatefulWidget {
  const Plane({super.key});

  @override
  State<Plane> createState() => _PlaneState();
}

class _PlaneState extends State<Plane> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1500),
          width: 75,
          height: 75,
          right: (switcher == Alignment.centerLeft) ? 75 : 0,
          child: const Icon(
            CupertinoIcons.airplane,
            size: 30,
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1500),
          width: 75,
          height: 75,
          left: (switcher == Alignment.centerRight) ? 75 : 0,
          child: const Icon(
            CupertinoIcons.airplane,
            size: 30,
          ),
        )
      ],
    );
  }
}
