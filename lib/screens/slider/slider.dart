import 'package:carousel_slider/carousel_slider.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ImageSliderScreen extends StatefulWidget {
  final List<String>? recipeStepsList;
  ImageSliderScreen({required this.recipeStepsList});
  @override
  _ImageSliderScreenState createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  //int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildItems(context),
    );
  }

  Widget _buildItems(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: false,
            ),
            items: widget.recipeStepsList!
                .map(
                  (e) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClayContainer(
                        spread: 2,
                        depth: 10,
                        borderRadius: 20,
                        color: Colors.white,
                        child: Container(
                          height: 23.h,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/RestaurantImage2.png',
                                fit: BoxFit.scaleDown,
                                height: 12.h,
                                width: 12.h,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0.w, 2.h, 0.w, 0),
                                child: Text(
                                  'Vegan Resto',
                                  style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0.5.h, 0, 0),
                                child: Text(
                                  '12 Mins',
                                  style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClayContainer(
                        spread: 2,
                        depth: 10,
                        borderRadius: 20,
                        color: Colors.white,
                        child: Container(
                          height: 23.h,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/RestaurantImage1.png',
                                fit: BoxFit.scaleDown,
                                height: 12.h,
                                width: 12.h,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0.w, 2.h, 0.w, 0),
                                child: Text(
                                  'Healthy Food',
                                  style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0.5.h, 0, 0),
                                child: Text(
                                  '8 Mins',
                                  style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}