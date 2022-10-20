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
  double pipeLoc = 1.4;
  int upperPipeSize = Random().nextInt(60) + 20;
  int emptySpace = Random().nextInt(30) + 30;
  int lowerPipeSize = Random().nextInt(60) + 20;
  final upperPipeKey = GlobalKey();
  final lowerPipeKey = GlobalKey();
  final birdKey = GlobalKey();
  int score = 0;
  int best = 0;
  double rotation = 0;
  double birdAngle = 0;

  void jump() {
    setState(() {
      time = 0;
      currentHeight = birdY;
    });
  }

  void reset() {
    setState(() {
      pipeLoc = 1.4;
      upperPipeSize = Random().nextInt(60) + 20;
      emptySpace = Random().nextInt(30) + 30;
      lowerPipeSize = Random().nextInt(60) + 20;
      if (emptySpace < (upperPipeSize + lowerPipeSize) / 4) {
        emptySpace = ((upperPipeSize + lowerPipeSize) / 3).toInt();
      }
      birdY = 0;
      rotation = 0;
      time = 0;
      height = 0;
      currentHeight = 0;
      if (score > best) {
        best = score;
      }
      score = 0;
      game = false;
    });
  }

  void scored() {
    setState(() {
      score += 1;
    });
  }

  void startGame() {
    game = true;
    Timer.periodic(Duration(milliseconds: 17), (timer) {
      time += 0.017;
      height = -4.9 * time * time + 2.9 * time;

      setState(() {
        birdY = currentHeight - height;
      });

      setState(() {
        rotation = -asin(height / sqrt(pow(height, 2) + pow(0.8, 2)));
      });

      setState(() {
        if (pipeLoc < -1.4) {
          upperPipeSize = Random().nextInt(60) + 20;
          emptySpace = Random().nextInt(30) + 25;
          lowerPipeSize = Random().nextInt(60) + 20;
          if (emptySpace < (upperPipeSize + lowerPipeSize) / 4) {
            emptySpace = ((upperPipeSize + lowerPipeSize) / 3).toInt();
          }
          pipeLoc += 2.8;
          scored();
        } else {
          pipeLoc -= 0.05;
        }
      });

      setState(() {
        RenderBox birdBox =
            birdKey.currentContext?.findRenderObject() as RenderBox;
        RenderBox upperPipeBox =
            upperPipeKey.currentContext?.findRenderObject() as RenderBox;
        RenderBox lowerPipeBox =
            lowerPipeKey.currentContext?.findRenderObject() as RenderBox;

        final birdSize = birdBox.size;
        final upperPipeSize = upperPipeBox.size;
        final lowerPipeSize = lowerPipeBox.size;

        final birdPosition = birdBox.localToGlobal(Offset.zero);
        final upperPipePosition = upperPipeBox.localToGlobal(Offset.zero);
        final lowerPipePosition = lowerPipeBox.localToGlobal(Offset.zero);

        if (birdPosition.dx < upperPipePosition.dx + upperPipeSize.width &&
            birdPosition.dx + birdSize.width > upperPipePosition.dx &&
            birdPosition.dy < upperPipePosition.dy + upperPipeSize.height &&
            birdPosition.dy + birdSize.height > upperPipePosition.dy) {
          timer.cancel();
          reset();
        }

        if (birdPosition.dx < lowerPipePosition.dx + lowerPipeSize.width &&
            birdPosition.dx + birdSize.width > lowerPipePosition.dx &&
            birdPosition.dy < lowerPipePosition.dy + lowerPipeSize.height &&
            birdPosition.dy + birdSize.height > lowerPipePosition.dy) {
          timer.cancel();
          reset();
        }
      });

      setState(() {
        if (pipeLoc == -1.4) {
          scored();
        }
      });

      if (birdY > 1 || birdY < -1) {
        timer.cancel();
        reset();
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
              Container(
                color: Colors.blue,
              ),
              AnimatedContainer(
                alignment: Alignment(pipeLoc, -1.4),
                duration: Duration(milliseconds: 0),
                child: Pipe(upperPipeSize, emptySpace, lowerPipeSize,
                    upperPipeKey, lowerPipeKey),
              ),
              AnimatedContainer(
                alignment: Alignment(-0.4, birdY),
                duration: Duration(milliseconds: 0),
                child: Transform.rotate(
                  angle: rotation,
                  child: Bird(birdKey),
                ),
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
                        '$score',
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
                        '$best',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
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
