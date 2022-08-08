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
          color: Colors.green,
          width: 30,
        ),
        SizedBox(
          height: space,
          width: 130,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}
