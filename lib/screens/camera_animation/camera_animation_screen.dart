import 'dart:math';

import 'package:designexperiments/screens/camera_animation/camera_item_screen.dart';
import 'package:flutter/material.dart';

class CameraAnimationScreen extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => CameraAnimationScreen(),
    );
  }

  @override
  _CameraAnimationScreenState createState() => _CameraAnimationScreenState();
}

class _CameraAnimationScreenState extends State<CameraAnimationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _canBeDragged;
  double maxSlide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    maxSlide = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset((_controller.value - 1) * maxSlide, 0),
                  child: Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(pi / 2 * (1 - _controller.value)),
                    child: CameraItemScreen(
                      maxWidth: maxSlide.toDouble(),
                      color: Colors.grey,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_controller.value * maxSlide, 0),
                  child: Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-pi / 2 * _controller.value),
                    child: CameraItemScreen(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft =
        _controller.isDismissed && details.globalPosition.dx < 100;
    bool isDragCloseFromRight =
        _controller.isCompleted && details.globalPosition.dx > 100;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      _controller.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _controller.fling(velocity: visualVelocity);
    } else if (_controller.value < 0.5) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }
}
