import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/default/red_dot.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'search',
                child: Padding(
                  padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: IconTheme(
                        data: IconThemeData(
                          color:
                              const Color.fromRGBO(218, 99, 23, 1).withOpacity(1),
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
                      contentPadding: EdgeInsets.all(10.0),
                      fillColor:
                          const Color.fromRGBO(218, 99, 23, 1).withOpacity(0.08),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(7.w, 3.h, 0.w, 0),
                child: Text(
                  'Popular Menu',
                  style: GoogleFonts.ptSans(
                    textStyle:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
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
                              'assets/images/MenuPhoto.png',
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
                                'Herbal Pancake',
                                style: GoogleFonts.ptSans(
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'Warung Herbal',
                                style: GoogleFonts.ptSans(
                                  textStyle: TextStyle(
                                      fontSize: 11.sp, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0.h, 0.w, 0),
                          child: Text(
                            '7€',
                            style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(218, 99, 23, 1),
                              ),
                            ),
                          ),
                        )
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
                              'assets/images/MenuPhoto.png',
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
                                'Herbal Pancake',
                                style: GoogleFonts.ptSans(
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'Warung Herbal',
                                style: GoogleFonts.ptSans(
                                  textStyle: TextStyle(
                                      fontSize: 11.sp, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0.h, 0.w, 0),
                          child: Text(
                            '7€',
                            style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(218, 99, 23, 1),
                              ),
                            ),
                          ),
                        )
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
                              'assets/images/MenuPhoto.png',
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
                                'Herbal Pancake',
                                style: GoogleFonts.ptSans(
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'Warung Herbal',
                                style: GoogleFonts.ptSans(
                                  textStyle: TextStyle(
                                      fontSize: 11.sp, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0.h, 0.w, 0),
                          child: Text(
                            '7€',
                            style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(218, 99, 23, 1),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
