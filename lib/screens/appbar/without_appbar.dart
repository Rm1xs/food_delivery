import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

PreferredSize withoutAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 0.h),
    child: Container(),
  );
}
