import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget redDot() {
  return Positioned(
    right: 2.w,
    top: 1.h,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(7),
      ),
      constraints: const BoxConstraints(
        minWidth: 4,
        minHeight: 4,
      ),
      child: SizedBox(
        width: 1,
        height: 1,
      ),
    ),
  );
}