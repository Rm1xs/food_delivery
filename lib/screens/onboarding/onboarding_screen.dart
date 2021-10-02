import 'dart:ui';
import 'package:flutter/material.dart';
import 'onboarding_entery_1.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    TimerRedirect();
    return Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [Colors.white, Colors.transparent],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Pattern.png',
                  width: MediaQuery.of(context).size.width * 1,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/Logo.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
    );
  }

  void TimerRedirect() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OnboardingEntery1()));
  }
}
