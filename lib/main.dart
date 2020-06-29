import 'package:designexperiments/screens/camera_animation/camera_animation_screen.dart';
import 'package:designexperiments/screens/wave_animation/wave_animation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text('Wave Animation'),
              onTap: () {
                Navigator.of(context).push(WaveAnimationScreen.route());
              },
            ),
            ListTile(
              title: Text('Camera Animation'),
              onTap: () {
                Navigator.of(context).push(CameraAnimationScreen.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}
