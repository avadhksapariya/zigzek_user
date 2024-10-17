import 'package:flutter/material.dart';
import 'package:zigzek_user/constants/text_themes.dart';
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
        textTheme: AppTextThemes.darkTextTheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const SplashScreen(),
    );
  }
}
