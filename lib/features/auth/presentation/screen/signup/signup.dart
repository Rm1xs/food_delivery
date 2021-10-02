import 'package:flutter/material.dart';
import 'package:food_delivery/core/util/sizer/size.dart';
import 'package:food_delivery/features/auth/presentation/widgets/green_button.dart';
import 'package:food_delivery/features/auth/presentation/widgets/round_check_box.dart';
import 'package:food_delivery/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:food_delivery/features/auth/presentation/widgets/text_widget.dart';
import 'package:food_delivery/features/auth/presentation/widgets/top_view_widget.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopViewWidget(), //35
          TextWidget(text: 'Sign Up For Free'), //5

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 43.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFieldWidget(
                    hintText: 'Login',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: null,
                  ),
                  TextFieldWidget(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: null,
                  ),
                  TextFieldWidget(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
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

          GreenButton(), //10
          Container(
            height: 7.h,
            child: Center(
              child: Text('already have an account?'),
            ),
          ), //5
        ],
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
