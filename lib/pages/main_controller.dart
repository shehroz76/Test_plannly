
import 'package:flutter/material.dart';
import 'package:test_plannly_app/components/app_background.dart';
import 'package:test_plannly_app/constants/helper.dart';
import 'package:test_plannly_app/pages/empty_page.dart';
import 'package:test_plannly_app/pages/home_page.dart';

import '../constants/styles.dart';

class MainController extends StatefulWidget {
  const MainController({Key? key}) : super(key: key);

  @override
  State<MainController> createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  int currentTab = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  final List<Widget> pages = const <Widget>[
    HomePage(),
    EmptyPage(),
    EmptyPage(),
    EmptyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AppBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: PageStorage(
            bucket: _bucket,
            child: pages[currentTab],
          ),
          bottomNavigationBar: bottomNavigationWidget(),
        )
      ]
    );
  }

  Widget bottomNavigationWidget() {
    return Container(
      height: 80,
      color: Colors.transparent,
      child: Row(
        children: [
          bottomMenuItem(0, Helper.HOME_MENU_ITEM),
          bottomMenuItem(1, Helper.STORES_MENU_ITEM),
          bottomMenuItem(2, Helper.ORDER_MENU_ITEM),
          bottomMenuItem(3, Helper.PROFILE_MENU_ITEM),
        ],
      ),
    );
  }

  void updateTab(int index) {
    setState(() {
      currentTab = index;
    });
  }

  Widget bottomMenuItem(int index, String title) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  updateTab(index);
                },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        border: Border.all( color: currentTab == index ? Colors.white70:Colors.transparent),
                        color: currentTab == index ? background_color : Colors.transparent,

                        borderRadius: BorderRadius.circular(55)
                    ),
                    child: Icon(Helper.getBottomMenuIcon(title),color: Colors.white,),
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
