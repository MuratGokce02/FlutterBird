import 'package:flutter/material.dart';
import 'bird.dart'

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: Container(
          color: Colors.blue,
          child: Bird(),
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
