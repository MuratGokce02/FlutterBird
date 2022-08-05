import 'package:flutter/material.dart';

class Bird extends StatefulWidget {
  const Bird({Key? key}) : super(key: key);
  _BirdState createState() => _BirdState();
}

class _BirdState extends State<Bird> {
  @override
  Widget build(BuildContext context) {
    return Image.asset('lib/images/bird.png');
  }
}
