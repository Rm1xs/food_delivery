import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/route/routes_path.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    timerRedirect();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ShaderMask(
              shaderCallback: (Rect rect) {
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
        ),
      ),
    );
  }

  Future<void> timerRedirect() async {
    return await Future.delayed(const Duration(seconds: 2));
  }
}
