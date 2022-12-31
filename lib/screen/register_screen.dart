
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piremit_app/components/buttons.dart';
import 'package:piremit_app/components/dimens.dart';
import 'package:piremit_app/components/text_field.dart';
import 'package:piremit_app/piremit_theme.dart';
import 'package:piremit_app/utils/designs/assets.dart';
import 'package:piremit_app/utils/designs/colors.dart';
import 'package:piremit_app/utils/res/res_profile.dart';

import '../components/routes.dart';
import '../utils/auth/auth_state.dart';


class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}
const double space = 18;

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

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
              horizontal: 30.0,
              vertical: 24.0
            ),
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  ResRegisterScreen.welcome,
                  style: PiremitTheme.lightTextTheme.bodyText1,
                ),
              ),
              vSpace(space * 0.4),
              Align(
                alignment: Alignment.center,
                child: Text(
                  ResRegisterScreen.enterDetails,
                  style: PiremitTheme.lightTextTheme.bodyText2,
                ),
              ),
              vSpace(space * 1.4),
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(Assets.registerImage),
                ),
              ),
              vSpace(space * 2.1),
              NameField(
                  state: TextFieldState(
                    labelText: ResRegisterScreen.name,
                    // label: ResRegisterScreen.name,
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Name cannot be empty';
                      }
                      return null;
                    }
                  ),
              ),
              vSpace(space * 1.9),
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
              vSpace(space * 1.6),
              primaryButton(
                  text: ResRegisterScreen.next,
                  onClick: () => state.onLoginClick(
                      form: form, ref:
                  ref, nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      context: context,
                  ),
                  fillColor: kPrimaryColor,
                  textColor: Colors.white,
                  isLoading: state.isLoginLoading,
              ),
              vSpace(space / 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ResRegisterScreen.haveAnAccount,
                    style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                      fontSize: 10.0,
                      color: Colors.black,
                    ),
                  ),
                  hSpace(space / 9),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                    child: Text(
                      ResRegisterScreen.login,
                      style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                        fontSize: 10.0,
                        color: Colors.redAccent,
                      ),
                    ),
                  )
                ],
              ),
              vSpace(space * 2),
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
              )
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
