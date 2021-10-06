import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:food_delivery/core/route/routes_path.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/cubit/login_cubit.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/cubit/login_state.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/login_widgets/button_login.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/login_widgets/email_input_login.dart';
import 'package:food_delivery/features/auth/presentation/widgets/top_view_widget.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'login_widgets/password_input_login.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(
                  content: const Text('Authentication Failure!'),
                  action: SnackBarAction(
                    label: 'Hide',
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  backgroundColor: Colors.deepOrangeAccent,
                )
            );
        }
        // if(state.status.isSubmissionSuccess){
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(
        //         SnackBar(
        //           content: const Text('Authentication Success'),
        //           action: SnackBarAction(
        //             label: 'Hide',
        //             textColor: Colors.white,
        //             onPressed: () {},
        //           ),
        //           behavior: SnackBarBehavior.floating,
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(24),
        //           ),
        //           backgroundColor: Colors.green,
        //         )
        //     );
        //      // Navigator.pushNamed(context, homePage);
        // }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopViewWidget(),
            Padding(
              padding: EdgeInsets.all(3.h),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Login To Your Account',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0.h),
              child: SizedBox(
                width: double.infinity,
                height: 8.h,
                child: EmailInputLogin(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0.h),
              child: SizedBox(
                width: double.infinity,
                height: 8.h,
                child: PasswordInputLogin(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5.w, 1.5.h, 5.w, 0.h),
              child: Text(
                'Or Continue With',
                textAlign: TextAlign.center,
                style: GoogleFonts.ptSans(
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
                    height: 7.5.h,
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
                            const Padding(
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
                const Spacer(),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0.h),
                  child: SizedBox(
                    width: 40.w,
                    height: 7.5.h,
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
                            const Padding(
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
              padding: EdgeInsets.all(4.h),
              child: InkWell(
                  child: Text(
                    'Forgot Your Password ?',
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 0.3,
                        color: Color.fromRGBO(83, 232, 139, 1),
                      ),
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, entery1Route)),
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: LoginButton(),
            ),
          ],
        ),
      ),
    );
  }
}
