import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_courses/screens/slider.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 250,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.topToBottom,
        splashTransition: SplashTransition.scaleTransition,
        splash: const CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/images/logo.png"),
          backgroundColor: Colors.white,
        ),
        nextScreen: const slider(),

// we can use
        duration: 5000,
//5000= 5 Second

//control the duration of the image , we can use
        animationDuration: const Duration(seconds: 5));
//small number : the duration will be speed
//large number : the duratiion will be slow);
  }
}