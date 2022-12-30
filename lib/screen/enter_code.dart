// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:piremit_app/components/buttons.dart';
import 'package:piremit_app/components/dimens.dart';
import 'package:piremit_app/components/text_field.dart';
import 'package:piremit_app/utils/designs/assets.dart';
import 'package:piremit_app/utils/res/res_profile.dart';

import '../piremit_theme.dart';
import '../utils/designs/colors.dart';


class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({Key? key}) : super(key: key);

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

const double space = 18;

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final pinController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 30.0,
          ),
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                ResCodeVerify.enterCode,
                style: PiremitTheme.lightTextTheme.bodyText1,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                ResCodeVerify.codeDetails,
                style: PiremitTheme.lightTextTheme.bodyText2,
              ),
            ),
            vSpace(space * 1.9),
            const Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(Assets.enterCode),
              ),
            ),
            vSpace(space * 6.3),
            const OtpFieldInput(),
            vSpace(space * 0.8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Resend Code in",
                  style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                    fontSize: 12,
                  )
                ),
                hSpace(space / 6),
                Text(
                  '',
                    style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                      fontSize: 12,
                      color: Colors.redAccent,
                    )
                ),
                hSpace(space / 6),
                Text(
                    'seconds',
                    style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                      fontSize: 12,
                    )
                ),
              ],
            ),
            vSpace(space * 6.1),
            welcomeButton(
                text: ResCodeVerify.next,
                onClick: () {},
                fillColor: kPrimaryColor,
                textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
