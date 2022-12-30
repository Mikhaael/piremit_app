import 'package:flutter/material.dart';
import 'package:piremit_app/components/dimens.dart';
import 'package:piremit_app/piremit_theme.dart';
import 'package:piremit_app/utils/designs/colors.dart';
import 'package:piremit_app/utils/res/res_profile.dart';

@immutable
class TextFieldState {
  final TextEditingController? controller;
  final Function()? onClick;
  final String label;
  final String labelText;
  final Widget? icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool isInputUnderline;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool expands;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;


  const TextFieldState({
    this.controller,
    this.onClick,
    this.labelText = '',
    this.label = '',
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.isInputUnderline = true,
    this.maxLines,
    this.expands = false,
    this.textInputAction,
    this.validator,
    this.textAlign = TextAlign.start,
  });

  TextFieldState copyWith({
    TextEditingController? controller,
    Function()? onClick,
    String? label,
    String? labelText,
    Widget? icon,
    TextInputType? keyboardType,
    bool? obscureText,
    bool? readOnly,
    bool? isInputUnderline,
    int? maxLines,
    bool? expands,
    TextInputAction? textInputAction,
    TextAlign? textAlign,
    String? Function(String?)? validator,
  }) =>
      TextFieldState(
          controller: controller ?? this.controller,
          onClick: onClick ?? this.onClick,
          label: label ?? this.label,
          labelText: labelText ?? this.labelText,
          icon: icon ?? this.icon,
          keyboardType: keyboardType?? this.keyboardType,
          obscureText: obscureText ?? this.obscureText,
          readOnly: readOnly ?? this.readOnly,
          isInputUnderline: isInputUnderline ?? this.isInputUnderline,
          maxLines: maxLines ?? this.maxLines,
          expands: expands ?? this.expands,
          textInputAction: textInputAction ?? this.textInputAction,
          textAlign: textAlign ?? this.textAlign,
          validator: validator ?? this.validator
      );
}

class NameField extends StatelessWidget {
  final TextFieldState state;

  const NameField({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      textAlign: state.textAlign,
      controller: state.controller,
      expands: state.expands,
      readOnly: state.readOnly,
      cursorColor: kPrimaryColor,
      textInputAction: state.textInputAction,
      keyboardType: state.keyboardType,
      obscureText: state.obscureText,
      style: PiremitTheme.lightTextTheme.headline3?.copyWith(
          fontSize: 14.0,
          color: Colors.black
      ),
      decoration: InputDecoration(
        labelText: state.labelText,
        labelStyle: PiremitTheme.lightTextTheme.headline3?.copyWith(
          fontSize: 14.0,
          color: Colors.grey
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 26.0,
          vertical: 25.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(6)
          ),
          borderSide: BorderSide(color: Color(0xFFD6D6D6), width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
          borderSide: BorderSide(
              color: Color(0xFFD6D6D6), width: 1.0
          ),
        ),
        suffixIcon: state.icon,
      ),
      maxLength: state.maxLines,
    );
  }
}

class EmailField extends StatefulWidget {
  final TextFieldState state;

  const EmailField({Key? key, required this.state}) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return NameField(
      state: state.copyWith(
        // labelText: (state.label.isEmpty) ? ResRegisterScreen.email : state.label,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value != null) {
            if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
              return null;
            }
            return 'Enter a valid Email Address';
          }
          return null;
        },
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextFieldState state;

  const PasswordField({Key? key, required this.state}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscured = true;


  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return NameField(
      state: state.copyWith(
        label: (state.label.isEmpty) ? ResRegisterScreen.password : state.label,
        obscureText: _obscured,
        keyboardType: TextInputType.visiblePassword,
        icon: GestureDetector(
          onTap: () {
            _obscured = _obscured ? false : true;
            setState(() {});
          },
          child: Icon(
            _obscured ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;

  const OtpInput(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        style: PiremitTheme.lightTextTheme.headline3?.copyWith(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: Colors.black
        ),
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10)
            ),
            borderSide: BorderSide(color: Color(0xFFD6D6D6), width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
                color: Color(0xFFD6D6D6), width: 1.0
            ),
          ),
            counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

class OtpFieldInput extends StatefulWidget {
  const OtpFieldInput({Key? key}) : super(key: key);

  @override
  State<OtpFieldInput> createState() => _OtpFieldInputState();
}

const double space = 18;
class _OtpFieldInputState extends State<OtpFieldInput> {

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  String? _otp;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpInput(_fieldOne), // auto focus
        hSpace(space * 1.3),
        OtpInput(_fieldTwo,),
        hSpace(space * 1.3),
        OtpInput(_fieldThree),
        hSpace(space * 1.3),
        OtpInput(_fieldFour),
        hSpace(space * 1.3),
      ],
    );
  }
}



