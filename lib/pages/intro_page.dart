import 'package:flutter/material.dart';
import 'package:test_plannly_app/constants/custom_text_styles.dart';

import '../components/app_background.dart';
import '../routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(path: 'images/ic_intro_bg.png'),
          introBody(context)
        ],
      ),
    );
  }

  Widget introBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('An Exceptional offer',
              style: CustomTextStyle.largeWhite(context)),
          Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text('in a limitless world of credit card',
                  style: CustomTextStyle.smallWhite(context))),
          Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'Visa  gold card with all applied\n reards and benifits and more.',
                style: CustomTextStyle.smallWhite(context),
              )),
          Padding(
            padding: const EdgeInsets.all(30),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                side: const BorderSide(width: .5, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.home);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                  child: Text(
                    "Next",
                    style: CustomTextStyle.buttonText(context),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
