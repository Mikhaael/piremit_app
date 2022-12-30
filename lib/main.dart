import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piremit_app/components/routes.dart';
import 'package:piremit_app/firebase_options.dart';
import 'package:piremit_app/utils/designs/colors.dart';

void main()  {
  runApp(const PiremitApp());
}

class PiremitApp extends StatelessWidget {
  const PiremitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.white,
              secondary: kButtonColor,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.apply(
                displayColor: kTextColor, bodyColor: kTextColor
              ).copyWith(
                button:  GoogleFonts.titilliumWeb()
              ),
            ),
          ),
          routes: Routes.routes,
        )
    );
  }
}

