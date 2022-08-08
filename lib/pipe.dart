import 'package:flutter/material.dart';

class Pipe extends StatefulWidget {
  const Pipe({Key? key}) : super(key: key);
  _PipeState createState() => _PipeState();
}

class _PipeState extends State<Pipe> {
  double space = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          width: 70,
          color: Colors.green,
        ),
        SizedBox(
          height: space,
        ),
        Container(
          width: 70,
          color: Colors.green,
        ),
      ]),
    );
  }
}
