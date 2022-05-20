import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: AnimatedSplashScreen(
            splash:  const Image(
              image: AssetImage("assets/images/applogo.png"),
              fit: BoxFit.cover,
            ),
            duration: 5,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.white, nextScreen: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
