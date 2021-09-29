import 'dart:ui';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.transparent],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height - 400),
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
    );
  }
}
