import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_delivery/features/auth/presentation/widgets/green_button.dart';
import 'onboarding_entery_2.dart';
import 'package:sizer/sizer.dart';
import 'package:sizer/sizer.dart';

class OnboardingEntery1 extends StatelessWidget {
  const OnboardingEntery1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                    'assets/images/Illustartion.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Find your Comfort\nFood here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Here You Can find a chef or dish for every\ntaste and color. Enjoy!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
                GreenButton(
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
