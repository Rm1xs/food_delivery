import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/route/routes_path.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_widgets/sign_up_button.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_widgets/sign_up_confirm_password_input.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_widgets/sign_up_email_input.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_widgets/sign_up_password_input.dart';
import 'package:food_delivery/features/auth/presentation/widgets/green_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/round_check_box.dart';
import 'package:food_delivery/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:food_delivery/features/auth/presentation/widgets/text_widget.dart';
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
      listener: (context, state) {
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
                TextWidget(text: 'Sign Up For Free'), //5

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Container(
                    height: 43.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EmailInput(),
                        PasswordInput(),
                        ConfirmPasswordInput(),
                        Row(
                          children: [
                            RoundCheckBox(
                              onTap: (selected) {},
                            ),
                            SizedBox(width: 10),
                            Text('Keep me Signed In'),
                          ],
                        ),
                        Row(
                          children: [
                            RoundCheckBox(
                              onTap: (selected) {},
                            ),
                            SizedBox(width: 10),
                            Text('Email Me About Special Fisting'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), //30

                SignUpButton(), //10
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
                        onTap: () => Navigator.pushNamed(context, signInRoute)),
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

//30
//5
//40
//7
//7

//92 ALL
