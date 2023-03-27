import 'package:architecture/core/lottie/app_lottie.dart';
import 'package:architecture/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHomePage();
   
  }

  void goToHomePage() {
    Future.delayed(const Duration(seconds: 0), () {
      context.router
          .replaceAll([const HomePageRoute()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Lottie.asset(AppLottie.splashLottie)),
    );
  }
}
