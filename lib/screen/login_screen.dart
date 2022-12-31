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

import '../utils/auth/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

const double space = 18;

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginState);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: form,
          child: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: 35.0,
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
                    labelText: ResRegisterScreen.email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Email cannot be empty';
                      }
                      return null;
                    }
                  )
              ),
              vSpace(space * 1.9),
              PasswordField(
                state: TextFieldState(
                  labelText: ResRegisterScreen.password,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  }
                ),
              ),
              vSpace(space * 0.3),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   InkWell(
                     onTap: () {
                       Navigator.pushNamed(context, Routes.forgotPassword1);
                     },
                     child: Text(
                       ResLoginScreen.forgotPassword,
                       style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                         fontSize: 10.0,
                         fontWeight: FontWeight.w300,
                         color: Colors.redAccent,
                       ),
                     ),
                   ),
                 ],
               ),
              vSpace(space * 3.2),
              primaryButton(
                  isLoading: state.isLoginLoading,
                  text: ResLoginScreen.next,
                  onClick: () => state.onLoginClick(
                      form: form,
                      ref: ref,
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      context: context
                  ),
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
                    image: Assets.googleImage,
                    isLoading: state.isGoogleLoading,
                    onPressed: () => state.onGoogleClick(ref, context),
                  ),
                  hSpace(space * 0.8),
                  socialButton(
                    image: Assets.facebookImage,
                    isLoading: state.isFacebookLoading,
                    onPressed: () => state.onFacebookClick(ref, context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
