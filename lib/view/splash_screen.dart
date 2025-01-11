import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interviewapp/routes/route_path.dart';
import 'package:interviewapp/utils/constants/assets_constants.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateToHome() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        RoutePath.homeRoute,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(AssetsConstants.splashLottie),
      ),
    );
  }
}
