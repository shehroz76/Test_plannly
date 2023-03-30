import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/custom_text_styles.dart';
import '../constants/helper.dart';
import 'app_background.dart';

class CardLayout extends StatefulWidget {
  const CardLayout(
      {Key? key,
      this.cardTopHeight = 0.2,
      this.cardTopWidth = 1,
      this.cardBottomHeight = 0.07,
      this.cardBottomWidth = 1,
      this.paddingLeft=0})

      : super(key: key);
  final double cardTopHeight;
  final double cardTopWidth;
  final double cardBottomHeight;
  final double cardBottomWidth;
  final double paddingLeft;

  @override
  State<CardLayout> createState() => _CardLayoutState();
}

class _CardLayoutState extends State<CardLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.paddingLeft),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Helper.getHeight(context) * widget.cardTopHeight,
            width: Helper.getWidth(context) * widget.cardTopWidth,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10))),
            alignment: Alignment.bottomRight,
            child: Stack(
              children: [
                const ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: AppBackground(path: 'images/ic_card_bg.png')),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '.... .... .... 3089',
                          style: CustomTextStyle.largeBlack(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: Helper.getHeight(context) * widget.cardBottomHeight,
            width: Helper.getWidth(context) * widget.cardBottomWidth,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('simon stCarede', style: CustomTextStyle.smallBlack(context),),
                  Text(
                    'visa',
                    style: CustomTextStyle.mediumBlack(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
