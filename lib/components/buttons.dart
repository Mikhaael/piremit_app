import 'package:flutter/material.dart';
import 'package:piremit_app/piremit_theme.dart';

primaryButton(
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