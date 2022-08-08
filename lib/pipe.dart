import 'package:flutter/material.dart';

class Pipe extends StatefulWidget {
  const Pipe({Key? key}) : super(key: key);
  _PipeState createState() => _PipeState();
}

class _PipeState extends State<Pipe> {
  double space = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 130,
          color: Colors.green,
        ),
        SizedBox(
          height: space,
          width: 130,
        ),
        Container(
          height: 100,
          width: 130,
          color: Colors.green,
        ),
      ],
    );
  }
}
