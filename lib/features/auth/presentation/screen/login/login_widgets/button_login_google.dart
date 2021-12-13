import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/cubit/login_cubit.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/cubit/login_state.dart';
import 'package:sizer/sizer.dart';

class ButtonLoginGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (BuildContext context, LoginState state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0.h),
          child: SizedBox(
            width: 40.w,
            height: 7.5.h,
            child: ElevatedButton(
              onPressed: () => {
                context.read<LoginCubit>().logInWithGoogle(),
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      style: TextStyle(color: Colors.black, fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
