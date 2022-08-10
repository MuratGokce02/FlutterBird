import 'package:flutter/material.dart';

class Pipe extends StatelessWidget {
  double pipeHeight = 0;
  Pipe(double this.pipeHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 120,
      height: pipeHeight,
    );
  }
}
