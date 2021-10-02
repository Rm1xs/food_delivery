import 'package:flutter/material.dart';
import 'package:food_delivery/core/util/sizer/size.dart';
import 'package:sizer/sizer.dart';

class TextWidget extends StatelessWidget {
  String text;

  TextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
