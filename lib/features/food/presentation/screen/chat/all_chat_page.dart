import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AllChatPage extends StatelessWidget {
  const AllChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(6.w, 0.h, 6.w, 0),
              child: Dismissible(
                key: Key('1'),
                child: InkWell(
                  onTap: () {
                    print('test');
                  },
                  child: ClayContainer(
                    color: Colors.white,
                    spread: 5,
                    depth: 10,
                    borderRadius: 20,
                    child: Container(
                      height: 12.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/PhotoProfile.png',
                                // width: 17.w,
                                // height: 9.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 3.h, 0.w, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Anamwp',
                                  style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  'Your Order Just Arrived!',
                                  style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                        fontSize: 11.sp, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
              child: ClayContainer(
                color: Colors.white,
                spread: 5,
                depth: 10,
                borderRadius: 20,
                child: Container(
                  height: 12.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/images/PhotoProfile.png',
                            // width: 17.w,
                            // height: 9.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 3.h, 0.w, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Anamwp',
                              style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Your Order Just Arrived!',
                              style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    fontSize: 11.sp, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
              child: ClayContainer(
                color: Colors.white,
                spread: 5,
                depth: 10,
                borderRadius: 20,
                child: Container(
                  height: 12.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/images/PhotoProfile.png',
                            // width: 17.w,
                            // height: 9.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 3.h, 0.w, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Anamwp',
                              style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Your Order Just Arrived!',
                              style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    fontSize: 11.sp, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
              child: ClayContainer(
                color: Colors.white,
                spread: 5,
                depth: 10,
                borderRadius: 20,
                child: Container(
                  height: 12.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/images/PhotoProfile.png',
                            // width: 17.w,
                            // height: 9.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 3.h, 0.w, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Anamwp',
                              style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Your Order Just Arrived!',
                              style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    fontSize: 11.sp, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
    );
  }
}
