import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/cubit/sign_up_cubit.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/cubit/sign_up_state.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (SignUpState previous, SignUpState current) =>
          previous.status != current.status,
      builder: (BuildContext context, SignUpState state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Container(
                height: 7.h,
                width: 40.w,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Color.fromRGBO(83, 232, 139, 1),
                      Color.fromRGBO(21, 190, 119, 1),
                    ],
                  ),
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: ElevatedButton(
                  key: const Key('signUpForm_continue_raisedButton'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: state.status.isValidated
                      ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      'Create',
                      style: GoogleFonts.ptSans(
                        textStyle: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
