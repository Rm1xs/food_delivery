import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class BottomCardDecoration extends StatelessWidget {
  const BottomCardDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2.h, 4.h, 2.h, 0),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'CARDHOLDER NAME',
              style: GoogleFonts.inconsolata(
                textStyle: TextStyle(fontSize: 8.sp, color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
          Text(
            'VALID THRU',
            style: GoogleFonts.inconsolata(
              textStyle: TextStyle(fontSize: 8.sp, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
