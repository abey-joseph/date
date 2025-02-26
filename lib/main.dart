import 'package:date/home_screen.dart';
import 'package:date/mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:
        ThemeData.light().copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
    home: (isMobile()) ? MobileScreen() : HomeScreen(),
  ));
}

bool isMobile() {
  String userAgent = html.window.navigator.userAgent.toLowerCase();
  return userAgent.contains("mobi"); // Detects most mobile devices
}
