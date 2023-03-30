import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({Key? key,this.path='images/ic_background.png'}) : super(key: key);
  final path;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(path)),
    );
  }
}
