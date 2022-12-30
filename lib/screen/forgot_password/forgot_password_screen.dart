import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piremit_app/components/buttons.dart';
import 'package:piremit_app/components/dimens.dart';
import 'package:piremit_app/piremit_theme.dart';
import 'package:piremit_app/utils/designs/assets.dart';
import 'package:piremit_app/utils/designs/colors.dart';
import 'package:piremit_app/utils/res/res_profile.dart';

import '../../components/text_field.dart';


enum ForgetPasswordScreenState { email, phone }

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}


const double space = 18.0;

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {

  final emailController = TextEditingController();
  var state = ForgetPasswordScreenState.email;
  final form = GlobalKey<FormState>();

  void _switch() {
    setState(() {
      if (state == ForgetPasswordScreenState.email) {
        state = ForgetPasswordScreenState.phone;
      } else {
        state = ForgetPasswordScreenState.email;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final isLogin = state == ForgetPasswordScreenState.email;


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
              Align(
                alignment: Alignment.topLeft,
                child: backButton(
                    image: isLogin ? Assets.backButton : Assets.backButton,
                    onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              vSpace(space * 0.5),
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: isLogin ? const AssetImage(Assets.pwForget) : const AssetImage(Assets.pwForget),
                ),
              ),
              vSpace(space * 2.9),
              Align(
                alignment: Alignment.center,
                child: Text(
                  isLogin ? ResForgetPassword.forgetPassword : ResForgetPassword.forgetPassword,
                  style: PiremitTheme.lightTextTheme.headline1?.copyWith(
                    fontSize: 22.0,
                  ),
                ),
              ),
              vSpace(space * 0.6),
              Align(
                alignment: Alignment.center,
                child: Text(
                  isLogin ? ResForgetPassword.fPSubtext : ResForgetPassword.fPSubtext,
                  style: PiremitTheme.lightTextTheme.bodyText2
                ),
              ),
              vSpace(space * 4.7),
                EmailField(
                    state: TextFieldState(
                      labelText: isLogin ? ResForgetPassword.phone: ResForgetPassword.email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    )
                ),
              vSpace(space * 0.3),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: _switch,
                    child: Text(
                      isLogin ? ResForgetPassword.useEmail : ResForgetPassword.usePhone,
                      style: PiremitTheme.lightTextTheme.headline3?.copyWith(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
              vSpace(space * 2.2),
              welcomeButton(
                  text: isLogin ? ResForgetPassword.next : ResForgetPassword.next,
                  onClick: () {},
                  fillColor: kPrimaryColor,
                  textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
