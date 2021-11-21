import 'dart:ui';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/features/food/data/models/restaurant_model.dart';
import 'package:food_delivery/features/food/presentation/cubit/food_cubit.dart';
import 'package:food_delivery/features/food/presentation/screen/food_search_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../injection.dart';

class FoodMainPage extends StatefulWidget {
  const FoodMainPage({Key? key}) : super(key: key);

  @override
  State<FoodMainPage> createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodMainPage> {
  @override
  void initState() {
    getLocation();
  }

  //final List<String> recipeStepsList = ['sdf'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 73.w,
                    //height: 7.h,
                    child: Hero(
                      tag: 'search',
                      child: TextField(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Search()));
                        },
                        decoration: InputDecoration(
                          prefixIcon: IconTheme(
                            data: IconThemeData(
                              color: const Color.fromRGBO(218, 99, 23, 1)
                                  .withOpacity(1),
                            ),
                            child: const Icon(Icons.search),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 0.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: const Color.fromRGBO(218, 99, 23, 1)
                                  .withOpacity(0.4)),
                          hintText: 'What do you want to order?',
                          contentPadding: EdgeInsets.all(10.0),
                          fillColor: const Color.fromRGBO(218, 99, 23, 1)
                              .withOpacity(0.08),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //width: 6.h,
                    //height: 6.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color.fromRGBO(218, 99, 23, 1)
                          .withOpacity(0.08), //Colors.white.withOpacity(0.5),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: IconTheme(
                        data: IconThemeData(
                            color: const Color.fromRGBO(218, 99, 23, 1)
                                .withOpacity(1)),
                        child: const Icon(Icons.settings_input_composite_sharp),
                      ),
                      color: const Color.fromRGBO(218, 99, 23, 1)
                          .withOpacity(0.08),
                      onPressed: () => {},
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
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                height: 20.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(29, 233, 182, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                          )),
                      child: Image.asset(
                        'assets/images/Promo_full.png',
                        width: MediaQuery.of(context).size.width * 1,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      right: 8.w,
                      top: 4.h,
                      child: Text(
                        'Special Deal For\nOctober',
                        style: GoogleFonts.ptSans(
                          textStyle: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 21.w,
                      top: 11.h,
                      child: SizedBox(
                        width: 22.w,
                        //height: 5.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Buy Now",
                            style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => {},
                    child: Text(
                      'View More',
                      style: GoogleFonts.ptSans(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey
                          //color: const Color.fromRGBO(218, 99, 23, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<RestaurantModel>(
              future: getLocation(),
              builder: (BuildContext context,
                  AsyncSnapshot<RestaurantModel> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else {
                      return Container(
                        height: 25.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.results.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClayContainer(
                                spread: 2,
                                depth: 10,
                                borderRadius: 20,
                                color: Colors.white,
                                child: Container(
                                  height: 23.h,
                                  width:
                                      MediaQuery.of(context).size.width *
                                          0.35,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/RestaurantImage2.png',
                                        fit: BoxFit.scaleDown,
                                        height: 12.h,
                                        width: 12.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0.w, 2.h, 0.w, 0),
                                        child: Text(
                                          snapshot
                                              .data!.results[i].poi.name,
                                          style: GoogleFonts.ptSans(
                                            textStyle: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight:
                                                    FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0, 0.5.h, 0, 0),
                                        child: Text(
                                          snapshot
                                              .data!.results[i].dist.toInt().toString() + ' meter',
                                          style: GoogleFonts.ptSans(
                                            textStyle: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight:
                                                    FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            //Text(snapshot.data!.results[i].poi.name);
                            //child: Text(snapshot.data!.results[i].poi.name));
                          },
                        ),
                      );
                    }
                }
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
              child: Row(
                children: [
                  Text(
                    'Popular Menu',
                    style: GoogleFonts.ptSans(
                      textStyle: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => {},
                    child: Text(
                      'View More',
                      style: GoogleFonts.ptSans(
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          color: const Color.fromRGBO(218, 99, 23, 1),
                        ),
                      ),
                    ),
                  ),
                ],
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
              padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 1.h),
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
    );
  }

  Future<RestaurantModel> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var data =
        sl<FoodCubit>().getRestaurants(position.latitude, position.longitude);
    return data;
  }
}
