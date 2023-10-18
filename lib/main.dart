import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:identity_app/first_screen.dart';
import 'package:identity_app/photo_scanner_screen.dart';
import 'package:identity_app/loader_screen.dart';
import 'package:identity_app/data_selection_screenn.dart';
import 'package:identity_app/selfie.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

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
      home: Screen1(),
    );
  }
}
