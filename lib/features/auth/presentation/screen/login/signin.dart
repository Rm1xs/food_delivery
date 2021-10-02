import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:food_delivery/features/auth/presentation/widgets/green_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/top_view_widget.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopViewWidget(),
              Padding(
                padding: EdgeInsets.all(3.h),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Login To Your Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 8.h,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 0.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 8.h,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 1.5.h, 5.w, 0.h),
                child: Text(
                  'Or Continue With',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0.h),
                    child: SizedBox(
                      width: 40.w,
                      height: 7.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Icon(
                                  FontAwesome5.facebook,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 0.h),
                    child: SizedBox(
                      width: 40.w,
                      height: 7.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Icon(
                                  FontAwesome5.google,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              Text(
                                'Google',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(3.5.h),
                child: Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                      color: Colors.lightGreen[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                      decoration: TextDecoration.underline),
                ),
              ),
              GreenButton(
                text: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
