import 'package:flutter/material.dart';
import 'package:test_plannly_app/constants/custom_text_styles.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Coming soon', style: CustomTextStyle.largeWhite(context),),
    );
  }
}
