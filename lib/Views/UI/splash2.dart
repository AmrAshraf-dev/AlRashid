import 'package:alrashid_mall_app/Views/Auth/signup.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  State<Splash2> createState() => _SplashState();
}

class _SplashState extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/splash.png'),
          AnimatedSplashScreen(
            duration: 4000,
            splash: 'assets/images/Alrashid_mall.png',
            splashIconSize: 150.0,
            nextScreen: SignUp(),
            splashTransition: SplashTransition.fadeTransition,
          ),
        ],
      ),
    );
  }
}
