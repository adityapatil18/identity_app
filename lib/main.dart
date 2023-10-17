import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:identity_app/screen1.dart';
import 'package:identity_app/screen2.dart';
import 'package:identity_app/screen3.dart';
import 'package:identity_app/screen5.dart';
import 'package:identity_app/selfie.dart';

void main() {
  runApp(IdentityApp());
}

class IdentityApp extends StatelessWidget {
  const IdentityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: AppBarTheme(
            centerTitle: false,
            color: Colors.white,
            elevation: 0.5,
          ),
          textTheme: GoogleFonts.kulimParkTextTheme(
            Theme.of(context).textTheme,
          )),
      home: Screen5(),
    );
  }
}
