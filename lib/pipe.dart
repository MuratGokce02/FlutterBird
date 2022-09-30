import 'package:flutter/material.dart';

class Pipe extends StatelessWidget {
  int flexUp = 1;
  int flexCenter = 1;
  int flexDown = 1;
  double pipeWidth = 60;
  var upperPipeKey = GlobalKey();
  var lowerPipeKey = GlobalKey();

  Pipe(this.flexUp, this.flexCenter, this.flexDown, this.upperPipeKey,
      this.lowerPipeKey);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            key: upperPipeKey,
            color: Colors.green,
            width: pipeWidth,
          ),
          flex: flexUp,
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            width: pipeWidth,
          ),
          flex: flexCenter,
        ),
        Expanded(
          child: Container(
            key: lowerPipeKey,
            color: Colors.green,
            width: pipeWidth,
          ),
          flex: flexDown,
        ),
      ],
    );
  }
}

/*
class Pipe extends StatelessWidget {
  double pipeHeight = 100;
  Pipe(double this.pipeHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 60,
      height: pipeHeight,
    );
  }
}
*/
