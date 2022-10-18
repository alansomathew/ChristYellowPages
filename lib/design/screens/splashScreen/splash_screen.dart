import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants/image.dart';
import '../../configs/themes/app_colors.dart';
import './onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => OnBoardingScreen())));

    // Future.delayed(
    //   const Duration(
    //     seconds: 5,
    //   ),
    // ).then((value) => {
    //       Navigator.of(context).pushReplacementNamed(
    //           MaterialPageRoute(builder: (ctx) => HomeScreen()));
    //     });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(
                image: AssetImage(
                  logo,
                ),
                width: 280,
              ),
              SizedBox(
                height: 50,
              ),
              SpinKitSpinningLines(
                color: Colors.indigo,
                size: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
