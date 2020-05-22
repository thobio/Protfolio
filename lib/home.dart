import 'package:flutter/material.dart';
import 'package:protfolio/coolers.dart';
import 'package:protfolio/header.dart';
import 'package:protfolio/middle.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolers.primaryColor,
      child: VStack([
        HeaderScreen(),
        if (context.isMobile) IntroductionWidget().p16(),
        MiddleScreen(),
      ]).scrollVertical(),
    );
  }
}
