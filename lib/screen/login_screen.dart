import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piremit_app/components/buttons.dart';
import 'package:piremit_app/components/dimens.dart';
import 'package:piremit_app/components/routes.dart';
import 'package:piremit_app/components/text_field.dart';
import 'package:piremit_app/piremit_theme.dart';
import 'package:piremit_app/utils/designs/assets.dart';
import 'package:piremit_app/utils/designs/colors.dart';
import 'package:piremit_app/utils/res/res_profile.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

const double space = 18;

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: form,
          child: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 24.0
            ),
            children: [
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(Assets.loginImage),
                ),
              ),
              vSpace(space * 1.7),
              Align(
                alignment: Alignment.center,
                child: Text(
                  ResLoginScreen.login,
                  style: PiremitTheme.lightTextTheme.bodyText1,
                ),
              ),
              vSpace(space * 0.4),
              Align(
                alignment: Alignment.center,
                child: Text(
                  ResLoginScreen.enterDetails,
                  style: PiremitTheme.lightTextTheme.bodyText2,
                ),
              ),
              vSpace(space * 3.8),
              EmailField(
                  state: TextFieldState(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  )
              ),
              vSpace(space * 1.9),
              PasswordField(
                state: TextFieldState(
                  labelText: ResRegisterScreen.password,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              vSpace(space * 0.3),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   InkWell(
                     onTap: () {},
                     child: Text(
                       ResLoginScreen.forgotPassword,
                       style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                         fontSize: 10.0,
                         fontWeight: FontWeight.w300,
                         color: Colors.pinkAccent,
                       ),
                     ),
                   ),
                 ],
               ),
              vSpace(space * 3.2),
              primaryButton(
                  text: ResLoginScreen.next,
                  onClick: () {},
                  fillColor: kPrimaryColor,
                  textColor: Colors.white
              ),
              vSpace(space / 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ResLoginScreen.haveAnAccount,
                    style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                      fontSize: 10.0,
                      color: Colors.black,
                    ),
                  ),
                  hSpace(space / 9),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    child: Text(
                      ResLoginScreen.signUp,
                      style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                        fontSize: 10.0,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  )
                ],
              ),
              vSpace(space * 3.3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ResRegisterScreen.signInWith,
                    style: PiremitTheme.lightTextTheme.bodyText1?.copyWith(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                  hSpace(space / 2),
                  socialButton(
                      image: Assets.facebookImage,
                      onClick: () {}
                  ),
                  hSpace(space * 0.8),
                  socialButton(
                      image: Assets.googleImage,
                      onClick: () {}
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
