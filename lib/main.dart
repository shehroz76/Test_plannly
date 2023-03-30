import 'package:flutter/material.dart';
import 'package:test_plannly_app/pages/intro_page.dart';
import 'package:test_plannly_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: RouteNames.intro,
      routes: routes,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => const IntroPage()),
    );
  }
}
