import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/core/route/routes_path.dart';
import 'package:food_delivery/features/auth/presentation/widgets/green_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class OnboardingEntery1 extends StatelessWidget {
  const OnboardingEntery1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                padding: EdgeInsets.all(2.h),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Find your Comfort\nFood here',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ptSans(
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
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
                    style: GoogleFonts.ptSans(
                      textStyle: TextStyle(
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ),
              ),
              const GreenButton(
                text: 'Next',
                redirectToRoute: entery2Route,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
