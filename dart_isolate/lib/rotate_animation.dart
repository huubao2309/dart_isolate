import 'dart:math';
import 'package:flutter/material.dart';

class RotateAnimation extends StatefulWidget {
  @override
  _RotateAnimationState createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 60), upperBound: pi * 2);

    animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 5.0).animate(animationController),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 80,
        width: 80,
        child: FlutterLogo(),
      ),
    );
  }
}
