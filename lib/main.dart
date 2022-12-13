import 'package:flutter/material.dart';
import 'package:funda_1/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      // initialRoute: "/home",
      routes: {
        "/": (context) => const LoginPage(), // object of class
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
      },
    );
  }
}
