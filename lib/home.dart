import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bird.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double birdY = 0;
  double time = 0;
  double currentHeight = 0;
  double height = 0;

  void jump() {
    currentHeight = birdY;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2 * time;
      setState(() {
        birdY = currentHeight - height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: GestureDetector(
          onTap: jump,
          child: AnimatedContainer(
            alignment: Alignment(-0.4, birdY),
            duration: Duration(milliseconds: 0),
            color: Colors.blue,
            child: Bird(),
          ),
        ),
        flex: 3,
      ),
      Expanded(
        child: Container(
          color: Colors.green,
        ),
        flex: 1,
      ),
    ]);
  }
}
