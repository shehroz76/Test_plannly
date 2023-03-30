import 'package:flutter/widgets.dart';
import 'package:test_plannly_app/pages/card_details_page.dart';
import 'package:test_plannly_app/pages/intro_page.dart';
import 'package:test_plannly_app/pages/main_controller.dart';

class RouteNames {
  RouteNames._();

  static const String home = '/home';
  static const String cardDetails = '/card_details';
  static const String intro = '/';
}

final routes = <String, WidgetBuilder>{
  RouteNames.home: (_) => const MainController(),
  RouteNames.cardDetails: (_) => const CardDetailsPage(),
  RouteNames.intro: (_) => const IntroPage(),
};
