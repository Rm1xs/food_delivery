import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FoodMainPage extends StatelessWidget {
  const FoodMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 73.w,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: IconTheme(
                            data: IconThemeData(
                              color: const Color.fromRGBO(218, 99, 23, 1)
                                  .withOpacity(1),
                            ),
                            child: const Icon(Icons.search),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: const Color.fromRGBO(218, 99, 23, 1)
                                  .withOpacity(0.4)),
                          hintText: 'What do you want to order?',
                          fillColor: const Color.fromRGBO(218, 99, 23, 1)
                              .withOpacity(0.08),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(1.w, 0.h, 0.w, 0),
                      child: Container(
                        width: 14.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color.fromRGBO(218, 99, 23, 1)
                              .withOpacity(
                                  0.08), //Colors.white.withOpacity(0.5),
                        ),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: IconTheme(
                              data: IconThemeData(
                                  color: Color.fromRGBO(218, 99, 23, 1)
                                      .withOpacity(1)),
                              child: Icon(Icons.settings_input_composite_sharp),
                            ),
                            color: const Color.fromRGBO(218, 99, 23, 1)
                                .withOpacity(0.08),
                            onPressed: () => {}),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 20.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/Promo_full.png',
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                child: Row(
                  children: [
                    Text(
                      'Nearest Restaurant',
                      style: GoogleFonts.ptSans(
                        textStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'View More',
                      style: GoogleFonts.ptSans(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          color: const Color.fromRGBO(218, 99, 23, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
