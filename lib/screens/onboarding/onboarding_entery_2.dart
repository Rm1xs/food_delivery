import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/route/routes_path.dart';
import 'package:food_delivery/features/auth/presentation/widgets/green_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class OnboardingEntery2 extends StatelessWidget {
  const OnboardingEntery2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset(
                  'assets/images/Illustration2.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Food Ninja is Where Your\nComfort Food Lives',
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
                    'Enjoy a fast and smooth food delivery at\nyour doorstep',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ptSans(
                      textStyle: TextStyle(
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ),
              ),
              const GreenButton(text: 'Next', redirectToRoute: signUpRoute),
            ],
          ),
        ),
      ),
    );
  }
}
