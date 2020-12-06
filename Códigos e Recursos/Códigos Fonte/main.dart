import 'loginPages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cives Project",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            textTheme:
                GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme)),
        home: Home());
  }
}
