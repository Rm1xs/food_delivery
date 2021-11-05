import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/default/red_dot.dart';
import 'package:food_delivery/screens/notification/notification_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

PreferredSize appbarWithText(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 22.h),
    child: Padding(
      padding: EdgeInsets.fromLTRB(6.w, 8.h, 6.w, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find Your',
                style: GoogleFonts.ptSans(
                  textStyle:
                      TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Favorite Food',
                style: GoogleFonts.ptSans(
                  textStyle:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.fromLTRB(6.w, 0.h, 0.w, 0),
            child: Container(
              //width: 10.w,
              //height: 5.h,
              child: ClayContainer(
                color: Colors.white,
                borderRadius: 15,
                depth: 20,
                spread: 8,
                child: Stack(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: IconTheme(
                        data: IconThemeData(color: Colors.green[300]),
                        child: Icon(Icons.notifications_none_sharp),
                      ),
                      color: Colors.white,
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NotificationPage(),
                          ),
                        )
                      },
                    ),
                    redDot(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
