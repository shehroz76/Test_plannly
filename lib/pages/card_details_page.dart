import 'package:flutter/material.dart';
import 'package:test_plannly_app/components/card_layout.dart';
import 'package:test_plannly_app/constants/custom_text_styles.dart';
import 'package:test_plannly_app/constants/helper.dart';

import '../components/app_background.dart';
import '../constants/styles.dart';

class CardDetailsPage extends StatelessWidget {
  const CardDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const AppBackground(),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topBarIcon(context),
                    const CardLayout(),
                    textWidget(context),
                    list(
                      context,
                      'Reveal card details',
                      Icons.account_balance_wallet_outlined,
                    ),
                    list(
                      context,
                      'Change PIN',
                      Icons.keyboard_alt_outlined,
                    ),
                    list(
                      context,
                      'Setup Limits',
                      Icons.phonelink_setup,
                    ),
                    list(
                      context,
                      'Block',
                      Icons.block,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topBarIcon(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.3),
              borderRadius: BorderRadius.circular(55)),
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget textWidget(BuildContext context) {
    return Container(
      width: Helper.getHeight(context),
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Billing address', style: CustomTextStyle.smallWhite(context)),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: Text('US california , 232 address',
                style: CustomTextStyle.smallWhiteBold(context)),
          )
        ],
      ),
    );
  }

  Widget list(BuildContext context, String label1, IconData icons) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: Container(
        height: Helper.getHeight(context) * 0.1,
        decoration: BoxDecoration(
          color: background_color.withOpacity(0.6),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Icon(
                icons,
                color: Colors.white,
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  label1,
                  style: CustomTextStyle.buttonText(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
