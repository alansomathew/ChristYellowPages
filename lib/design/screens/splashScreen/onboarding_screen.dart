import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/text.dart';
import '../../configs/themes/app_colors.dart';
import '../../widgets/app_circle_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String routeName = '/onboarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.star,
            size: 65,
            color: Colors.orangeAccent,
          ),
          const SizedBox(
            height: 40,
          ),
          // ignore: prefer_const_constructors
          Text(
            textAlign: TextAlign.center,
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 18,
              color: onSurfaceTextColor,
              fontWeight: FontWeight.bold,
            ),
            introductionText,
          ),
          const SizedBox(
            height: 40,
          ),
          AppCircleButton(
            onTap: () => Get.offAndToNamed("/welcome"),
            width: 200,
            color: Colors.amber,
            child: const Icon(Icons.arrow_forward, size: 35),
          )
        ],
      ),
    ));
  }
}
