import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/login_page.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_widgets/sign_up_button.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_widgets/sign_up_confirm_password_input.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_widgets/sign_up_email_input.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_widgets/sign_up_password_input.dart';
import 'package:food_delivery/features/auth/presentation/widgets/top_view_widget.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'cubit/sign_up_cubit.dart';
import 'cubit/sign_up_state.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (BuildContext context, SignUpState state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Sign Up Failure')),
            );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const TopViewWidget(), //35
                Text(
                  'Sign Up For Free',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Container(
                    height: 35.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 8.h, child: EmailInput()),
                        SizedBox(height: 8.h, child: PasswordInput()),
                        SizedBox(height: 8.h, child: ConfirmPasswordInput()),
                        // Row(
                        //   children: [
                        //     RoundCheckBox(
                        //       onTap: (selected) {},
                        //     ),
                        //     SizedBox(width: 10),
                        //     Text('Keep me Signed In'),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     RoundCheckBox(
                        //       onTap: (selected) {},
                        //     ),
                        //     SizedBox(width: 10),
                        //     Text('Email Me About Special'),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ), //30

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8.h, 0, 0),
                  child: SignUpButton(),
                ), //10
                Container(
                  height: 7.h,
                  child: Center(
                    child: InkWell(
                        child: Text(
                          'Already have account ?',
                          style: GoogleFonts.ptSans(
                            textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 0.3,
                              color: Color.fromRGBO(83, 232, 139, 1),
                            ),
                          ),
                        ),
                        onTap: () => Navigator.push<void>(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()))),
                  ),
                ), //5
              ],
            ),
          ),
        ),
      ),
    );
  }
}
