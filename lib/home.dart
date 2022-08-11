import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbird/pipe.dart';
import 'bird.dart';
import 'pipe.dart';
import 'dart:math';

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
  double pipeLoc = 1;
  double lowerPipeSize = Random().nextDouble() * 500;
  double upperPipeSize = 0;

  void jump() {
    setState(() {
      time = 0;
      currentHeight = birdY;
    });
  }

  void startGame() {
    game = true;
    upperPipeSize = Random().nextDouble() * 500;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdY = currentHeight - height;
      });
      setState(() {
        if (pipeLoc < -1.4) {
          pipeLoc += 2.7;
        } else {
          pipeLoc -= 0.05;
        }
      });
      setState(() {
        if (upperPipeSize + lowerPipeSize > 1000) {
          if (upperPipeSize > lowerPipeSize) {
            upperPipeSize -= 100;
          } else {
            lowerPipeSize -= 100;
          }
        }
      });
      if (birdY > 1) {
        timer.cancel();
        game = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (game) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(children: <Widget>[
          Expanded(
            child: Stack(children: [
              AnimatedContainer(
                alignment: Alignment(-0.4, birdY),
                duration: Duration(milliseconds: 0),
                color: Colors.blue,
                child: Bird(),
              ),
              Container(
                alignment: Alignment(0, 0.5),
                child: game
                    ? Text(' ')
                    : Text(
                        'PLAY',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
              ),
              AnimatedContainer(
                alignment: Alignment(pipeLoc, -1.4),
                duration: Duration(milliseconds: 0),
                child: Pipe(upperPipeSize),
              ),
              AnimatedContainer(
                alignment: Alignment(pipeLoc, 1.4),
                duration: Duration(milliseconds: 0),
                child: Pipe(lowerPipeSize),
              ),
            ]),
            flex: 3,
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SCORE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BEST',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
        ]),
      ),
    );
  }
}
