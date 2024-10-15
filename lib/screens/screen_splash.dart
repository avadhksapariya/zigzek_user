import 'package:flutter/material.dart';
import 'package:zigzek_user/constants/color_palettes.dart';
import 'package:zigzek_user/screens/screen_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late Animation<double> logoFadeAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalettes.redPrimaryColor,
      child: Center(
        child: FadeTransition(
          opacity: logoFadeAnimation,
          child: const Image(
            image: AssetImage('assets/images/ic_zigzek.png'),
            width: 161,
            height: 161,
          ),
        ),
      ),
    );
  }
}
