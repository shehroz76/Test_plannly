import 'package:flutter/material.dart';

final Color greyy = Color.fromRGBO(128, 128, 137, 1);
final Color lightgrey = Color.fromRGBO(0, 0, 0, 0.05);
final Color blue = Color.fromRGBO(26, 148, 255, 1);
final Color background_color = Color(0xff2c1f26).withOpacity(.9);
final Color background = Colors.blue.shade50;
final colors = <Color>[Colors.indigo, Colors.deepPurpleAccent];
final colors2 = <Color>[
  Colors.white,
  Colors.deepPurpleAccent.withAlpha(10),
];

final mainGradient = LinearGradient(colors: colors);

final drawerBodyGradient =
LinearGradient(colors: colors2);

final scaffoldBodyGradient = LinearGradient(colors: colors);