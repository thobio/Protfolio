import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:protfolio/coolers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameWidget = "Thobio\nJoseph."
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make();

    var expanded = Expanded(
      child: VxResponsive(
        fallback: const Offstage(),
        small:
            IntroductionWidget().pOnly(left: 20).h(context.percentHeight * 60),
        medium:
            IntroductionWidget().pOnly(left: 120).h(context.percentHeight * 60),
        large:
            IntroductionWidget().pOnly(left: 120).h(context.percentHeight * 60),
      ),
    );
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: VxBox(
                child: VStack([
          ZStack([
            PictureWidget(),
            Container(
              color: Coolers.secondaryColor.withOpacity(0.5),
              height: context.percentHeight * 60,
            ),
            Row(
              children: [
                VStack([
                  if (context.isMobile) 50.heightBox else 10.heightBox,
                  CustomAppBar().shimmer(
                    primaryColor: Coolers.accentColor,
                  ),
                  30.heightBox,
                  nameWidget.shimmer(primaryColor: Coolers.accentColor),
                  20.heightBox,
                  VxBox()
                      .color(Coolers.accentColor)
                      .size(60, 10)
                      .make()
                      .shimmer(primaryColor: Coolers.accentColor),
                  30.heightBox,
                  SocialAccounts()
                ]).pSymmetric(h: context.percentWidth * 10, v: 32),
                expanded,
              ],
            ).w(context.screenWidth),
          ]),
        ]))
            .size(context.screenWidth, context.percentHeight * 60)
            .color(Coolers.secondaryColor)
            .make(),
      ),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          "- Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "Senior Software Engineer for iOS, \nWorking on Swift, SwiftUI, Flutter, Dart and Firebase"
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        RaisedButton(
          onPressed: () {
            launch("mailto:mail-me@thobiojoseph.in?subject=&body=");
          },
          child: "Contact Me".text.make(),
          color: Coolers.accentColor,
          shape: Vx.roundedLg,
          hoverColor: Vx.purple200,
        ).h(50).w(200)
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class PictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(0),
      child: Image.asset(
        "assets/1.png",
        fit: BoxFit.cover,
        height: context.percentHeight * 60,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.appstore_o,
      size: 50,
      color: Coolers.accentColor,
    );
  }
}

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      Icon(AntDesign.github, color: Colors.white).mdClick(() {
        launch("https://github.com/thobio",
            forceSafariVC: true, forceWebView: true, enableJavaScript: true);
      }).make(),
      20.widthBox,
      Icon(AntDesign.linkedin_square, color: Colors.white).mdClick(() {
        launch("https://www.linkedin.com/in/thobio-joseph-529a29133/",
            forceSafariVC: true, forceWebView: true, enableJavaScript: true);
      }).make(),
      20.widthBox,
      Icon(AntDesign.youtube, color: Colors.white).mdClick(() {
        launch("https://www.youtube.com/channel/UCGuZhIrYdb_BPISrX_Zq7Tw",
            forceSafariVC: true, forceWebView: true, enableJavaScript: true);
      }).make(),
      20.widthBox,
      Icon(AntDesign.instagram, color: Colors.white).mdClick(() {
        launch("https://instagram.com/thobio",
            forceSafariVC: true, forceWebView: true, enableJavaScript: true);
      }).make(),
    ].hStack();
  }
}
