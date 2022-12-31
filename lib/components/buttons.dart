import 'package:flutter/material.dart';
import 'package:piremit_app/piremit_theme.dart';

primaryButton(
    {required String text,
      required GestureTapCallback onClick,
      required Color fillColor,
      required Color textColor,
      required bool isLoading,
      double borderRadius = 8,
      MainAxisAlignment viewAlignment = MainAxisAlignment.center,
      TextStyle? textStyle,
      FontWeight fontWeight = FontWeight.w600}) =>
    InkWell(
      onTap: onClick,
        child: Container(
          width: 278.0,
          height: 53.0,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            mainAxisAlignment: viewAlignment,
            children: [
              Text(
                isLoading ? 'please wait...' : text,
                style: textStyle ??
                    PiremitTheme.lightTextTheme.headline1?.copyWith(
                    color: textColor,
                    fontWeight: fontWeight,
                    fontSize: 15.0,
                    )
              ),
            ],
          ),
        ),
    );

welcomeButton(
    {required String text,
      required GestureTapCallback onClick,
      required Color fillColor,
      required Color textColor,
      double borderRadius = 8,
      MainAxisAlignment viewAlignment = MainAxisAlignment.center,
      TextStyle? textStyle,
      FontWeight fontWeight = FontWeight.w600}) =>
    InkWell(
      onTap: onClick,
      child: Container(
        width: 278.0,
        height: 53.0,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          mainAxisAlignment: viewAlignment,
          children: [
            Text(
                text,
                style: textStyle ??
                    PiremitTheme.lightTextTheme.headline1?.copyWith(
                      color: textColor,
                      fontWeight: fontWeight,
                      fontSize: 15.0,
                    )
            ),
          ],
        ),
      ),
    );

socialButton({
  required String image,
  required bool isLoading,
  required VoidCallback? onPressed}) =>
    InkWell(
      onTap: isLoading ? null : onPressed,
      child: Material(
          child: Container(
            height: 24.0,
            width: 24.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.transparent,
            ),
            child: Image(
              image: AssetImage(image),
              width: 24.0,
              height: 24.0,
            ),
          ),
      ),
    );

backButton({required String image, required GestureTapCallback? onPressed}) =>
    InkWell(
      onTap: onPressed,
      child: Material(
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );