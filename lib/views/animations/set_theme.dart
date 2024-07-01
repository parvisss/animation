import 'package:animation/views/animations/clouds.dart';
import 'package:animation/views/animations/plane.dart';
import 'package:animation/views/animations/road.dart';
import 'package:flutter/material.dart';
import 'package:animation/models/animation_models.dart';

class SetTheme extends StatefulWidget {
  const SetTheme({super.key});

  @override
  State<SetTheme> createState() => _SetThemeState();
}

class _SetThemeState extends State<SetTheme> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: switcher == Alignment.centerLeft
          ? ThemeData.light()
          : ThemeData.dark(),
      child: Scaffold(
        body: Center(
          child: InkWell(
            child: Container(
              height: 80,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(50),
              ),
              clipBehavior: Clip.hardEdge,
              child: AnimatedAlign(
                alignment: switcher,
                duration: const Duration(milliseconds: 1400),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    switcher == Alignment.centerRight
                        ? const Clouds()
                        : const SizedBox(),
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: switcher == Alignment.centerLeft
                            ? Colors.grey
                            : Colors.blue,
                      ),
                      child: Plane(),
                    ),
                    switcher == Alignment.centerLeft
                        ? const Road()
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            onTap: () {
              setState(
                () {
                  switcher = (switcher == Alignment.centerLeft)
                      ? Alignment.centerRight
                      : Alignment.centerLeft;
                  plane = (plane == Alignment.centerLeft)
                      ? Alignment.centerRight
                      : Alignment.centerLeft;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
