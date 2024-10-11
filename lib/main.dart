import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigzek_user/screens/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZigZek',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const SplashScreen(),
    );
  }
}
