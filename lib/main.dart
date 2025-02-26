import 'package:date/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:
        ThemeData.light().copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
    home: HomeScreen(),
  ));
}
