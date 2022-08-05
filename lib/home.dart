import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bird.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static double birdY = 0;
  double time = 0;
  double currentHeight = birdY;
  double height = 0;
  bool game = false;

  void jump() {
    setState(() {
      time = 0;
      currentHeight = birdY;
    });
  }

  void startGame() {
    game = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdY = currentHeight - height;
      });
      if (birdY > 0) {
        timer.cancel();
        game = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: GestureDetector(
          onTap: () {
            if (game) {
              jump();
            } else {
              startGame();
            }
          },
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
