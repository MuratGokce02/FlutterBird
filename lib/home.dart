import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bird.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double birdHeight = 0;

  void jump() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        birdHeight += 0.1;
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
            alignment: Alignment(-0.4, birdHeight),
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
