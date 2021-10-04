import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopViewWidget extends StatelessWidget {
  const TopViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
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
                  height: 30.h,
                  width: 100.w,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 25.h,
              //width: getProportionateScreenWidth(100),
              child: Image.asset(
                'assets/images/Logo.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],

        //Text('Sign Up For Free'),
      ),
    );
  }
}
