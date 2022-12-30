import 'package:flutter/material.dart';
import 'package:piremit_app/components/buttons.dart';
import 'package:piremit_app/components/dimens.dart';
import 'package:piremit_app/components/routes.dart';
import 'package:piremit_app/piremit_theme.dart';
import 'package:piremit_app/utils/designs/colors.dart';
import 'package:piremit_app/utils/res/res_profile.dart';
import '../utils/designs/assets.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

const double space = 18.0;

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35.0,
                  vertical: 14.0,
                ),
                children: [
                  const Image(
                      image: AssetImage(Assets.welcomeImage)
                  ),
                  vSpace(space * 1.9),
                  const Image(
                      image: AssetImage(Assets.appLogo)
                  ),
                  vSpace(space * 1.8),
                  Text(
                    ResWelcomeScreen.welcomeMessage1,
                    style: PiremitTheme.lightTextTheme.headline1,
                  ),
                  vSpace(space * 1.3),
                  Text(
                    ResWelcomeScreen.welcomeMessage2,
                    style: PiremitTheme.lightTextTheme.headline4,
                  ),
                  vSpace(space * 5.2),
                  welcomeButton(
                      text: ResWelcomeScreen.getStarted,
                      onClick: () {
                        Navigator.pushNamed(context, Routes.register);
                      },
                      fillColor: kPrimaryColor,
                      textColor: Colors.white,
                  ),
                ],
              ),
          ),
    );
  }
}
