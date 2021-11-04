import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/default/red_dot.dart';
import 'package:food_delivery/screens/notification/notification_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

PreferredSize appbar2(String line, bool button, BuildContext context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 22.h),
    child: Padding(
      padding: EdgeInsets.fromLTRB(6.w, 3.h, 6.w, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromRGBO(249, 168, 77, 1)
                      .withOpacity(0.2), //Colors.white.withOpacity(0.5),
                ),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    color: const Color.fromRGBO(218, 99, 23, 1),
                    onPressed: () => {Navigator.of(context).pop()}
                    // sl<AuthenticationBloc>().add(AppLogoutRequested()),
                    ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                child: Text(
                  line,
                  style: GoogleFonts.ptSans(
                    textStyle:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Visibility(
            visible: button,
            child: Padding(
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
          ),
        ],
      ),
    ),
  );
}
