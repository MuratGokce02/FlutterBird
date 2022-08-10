import 'package:flutter/material.dart';

class Pipe extends StatelessWidget {
  int pipeHeight = 0;
  Pipe(int this.pipeHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 60,
      height: pipeHeight,
    );
  }
}
