import 'package:flutter/material.dart';
import 'package:subtracker/screens/landing_page.dart';

void main() {
  runApp(const Subtracker());
}

class Subtracker extends StatelessWidget {
  const Subtracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          background: Color(0xff0e0e12),
          onBackground: Color(0xffe0e0e6),
          brightness: Brightness.dark,
          error: Colors.red,
          onError: Colors.white,
          primary: Color(0xff5e00f5),
          onPrimary: Color(0xffffffff),
          secondary: Color(0xff0fad90),
          onSecondary: Color(0xffffffff),
          surface: Color(0xff1c1c23),
          onSurface: Color(0xffffffff),
        ),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}
