import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_plannly_app/constants/custom_text_styles.dart';

import '../components/app_background.dart';
import 'package:test_plannly_app/constants/helper.dart';

import '../components/card_layout.dart';
import '../constants/styles.dart';
import '../routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cardList = [
    'card1',
    'card2',
    'card3',
    'card4',
    'card5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: Platform.isAndroid ? true : false,
        left: false,
        right: false,
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  topBar(context),
                  cardListWidget(context),
                  totalAmount(context),
                  paymentBoard(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Row(
        children: [
          const RotationTransition(
              turns: AlwaysStoppedAnimation(340 / 360),
              child: Icon(
                Icons.phone_android_outlined,
                color: Colors.white,
                size: 22,
              )),
          Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Shake to reveal balance',
                style: CustomTextStyle.smallWhite(context),
              )),
          const Spacer(),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.3),
                borderRadius: BorderRadius.circular(55)),
            child: const Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardListWidget(BuildContext context) {
    return SizedBox(
      width: Helper.getWidth(context),
      height: Helper.getHeight(context) * .25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.cardDetails);
              },
              child: const CardLayout(
                  cardTopHeight: 0.15,
                  cardTopWidth: 0.65,
                  cardBottomHeight: 0.06,
                  cardBottomWidth: 0.65,
                  paddingLeft: 50.0));
        },
      ),
    );
  }

  Widget totalAmount(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 30),
        child: Text(
          '\$ 23232',
          style: CustomTextStyle.mediumWhite(context),
        ));
  }

  Widget paymentBoard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: Helper.getWidth(context),
        decoration: BoxDecoration(
            color: background_color.withOpacity(0.6), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              paymentBoxItem(context, 3),
              paymentBoxItem(context, 2),
              paymentBoxItem(context, 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentBrands(BuildContext context, int size) {
    return SizedBox(
      height: 30,
      width: Helper.getWidth(context) * .2,
      child: Stack(
        children: [
          for (var i = 0; i < size; i++)
            Positioned(
              right: (i * (1 - .4) * 40).toDouble(),
              top: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      border: Border.all(color: background_color, width: 2),
                      borderRadius: BorderRadius.circular(50)),
                  padding: const EdgeInsets.all(5.0),
                  // child: Icon(Icons.person_3_outlined, size: 18,),
                  child: Image.network('https://cdn.sanity.io/images/czqk28jt/prod_bk/f4dc27eb7337f7cbd12d3ccd840e6a031fcba622-360x270.jpg',width: 20,height: 20,),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget paymentBoxItem(BuildContext context, int size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.payment,
            size: 20,
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 25),
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$ 200,000',
                        style: CustomTextStyle.mediumWhite(context)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Spent in January',
                          style: CustomTextStyle.smallWhite(context)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          paymentBrands(context, size),
        ],
      ),
    );
  }
}
