import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  Bird(this.birdKey);
  var birdKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: birdKey,
      height: 50,
      width: 50,
      child: Image.asset('lib/images/bird.png'),
    );
  }
}
