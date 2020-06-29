import 'dart:math';

import 'package:designexperiments/screens/wave_animation/wave_clipper.dart';
import 'package:flutter/material.dart';

class WaveAnimationScreen extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => WaveAnimationScreen(),
    );
  }

  @override
  _WaveAnimationScreenState createState() => _WaveAnimationScreenState();
}

class _WaveAnimationScreenState extends State<WaveAnimationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Offset> _points = [];
  double _offset = 200;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      upperBound: 2 * pi,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_vert),
        onPressed: () {
          setState(() {
            if (_offset != 0) {
              _offset = 0;
            } else {
              _offset = 200;
            }
          });
        },
      ),
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: _offset,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, child) => ClipPath(
                  clipper: WaveClipper(
                    value: _controller.value,
                    wavePoints: _points,
                  ),
                  child: child,
                ),
                child: Container(
                  color: Colors.red,
                  height: size.height,
                  width: size.width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
