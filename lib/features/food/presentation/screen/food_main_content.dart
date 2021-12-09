import 'dart:ui';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:food_delivery/features/food/data/models/restaurant_model.dart';
import 'package:food_delivery/features/food/presentation/cubit/food_cubit.dart';
import 'package:food_delivery/features/food/presentation/screen/restaurant_routes/test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../../injection.dart';
import 'food_details/food_details_page.dart';

class FoodMainPage extends StatefulWidget {
  const FoodMainPage({Key? key}) : super(key: key);

  @override
  State<FoodMainPage> createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodMainPage> {
  String menu = 'Popular menu';
  late Future<FoodModel> data;
  late Future<RestaurantModel> rest;
  final GlobalKey<State<StatefulWidget>> dataKey = GlobalKey();

  @override
  void initState() {
    rest = getLocation();
    data = sl<FoodCubit>().getFood('pizza');
  }

  //final List<String> recipeStepsList = ['sdf'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 11.h),
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
                        onSubmitted: (String text) =>
                            Scrollable.ensureVisible(dataKey.currentContext!),
                        onTap: () {
                          setState(() {
                            menu = 'Search Result';
                          });
                        },
                        onChanged: (String text) => {
                          setState(() {
                            data = sl<FoodCubit>().getFood(text);
                          })
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
                          contentPadding: const EdgeInsets.all(10.0),
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
                      icon: const IconTheme(
                        data: IconThemeData(
                          color: Colors.grey,
                        ),
                        // const Color.fromRGBO(218, 99, 23, 1)
                        //     .withOpacity(1)),
                        child: Icon(Icons.settings_input_composite_sharp),
                      ),
                      color: const Color.fromRGBO(218, 99, 23, 1)
                          .withOpacity(0.08),
                      onPressed: () => {print('tap')},
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
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blue,
                              Colors.red,
                            ],
                          ),
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
                            'Buy Now',
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
                    onTap: () => {print('tap')},
                    child: Text(
                      'View More',
                      style: GoogleFonts.ptSans(
                        textStyle: TextStyle(fontSize: 10.sp, color: Colors.grey
                            //color: const Color.fromRGBO(218, 99, 23, 1),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<RestaurantModel>(
              future: rest,
              builder: (BuildContext context,
                  AsyncSnapshot<RestaurantModel> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Padding(
                      padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                      child: const Center(child: CircularProgressIndicator()),
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
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const MapSample(),
                                  ),
                                ),
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ClipRect(
                                  child: Banner(
                                    message: 'HOT',
                                    location: BannerLocation.topEnd,
                                    color: Colors.orange,
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
                                              height: 11.h,
                                              width: 11.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  2.w, 2.h, 2.w, 0),
                                              child: Text(
                                                snapshot.data!.results[index]
                                                    .poi.name,
                                                overflow: TextOverflow.ellipsis,
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
                                                  0, 2.h, 0, 0),
                                              child: Text(
                                                snapshot.data!.results[index]
                                                        .dist
                                                        .toInt()
                                                        .toString() +
                                                    ' meters',
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
                    menu,
                    style: GoogleFonts.ptSans(
                      textStyle: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      // Navigator.push<void>(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => TestPage(),
                      //   ),
                      // ),
                    },
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
            FutureBuilder<FoodModel>(
              key: dataKey,
              future: data,
              builder:
                  (BuildContext context, AsyncSnapshot<FoodModel> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.hits.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () => Navigator.push<void>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => FoodDetailsPage(
                                        data: snapshot.data!.hits[index].recipe,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                                    child: ClayContainer(
                                      color: Colors.white,
                                      spread: 5,
                                      depth: 10,
                                      borderRadius: 20,
                                      child: SizedBox(
                                        height: 12.h,
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.w, 1.h, 0, 1.h),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                child: Image.network(
                                                  snapshot.data!.hits[index]
                                                      .recipe.image,
                                                  // width: 17.w,
                                                  // height: 9.h,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.w, 3.h, 0.w, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Text(
                                                      snapshot.data!.hits[index]
                                                          .recipe.label,
                                                      style: GoogleFonts.ptSans(
                                                        textStyle: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data!.hits[index]
                                                        .recipe.dish[0],
                                                    style: GoogleFonts.ptSans(
                                                      textStyle: TextStyle(
                                                          fontSize: 11.sp,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.w, 0.h, 2.w, 0),
                                              child: Text(
                                                '7€',
                                                style: GoogleFonts.ptSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromRGBO(
                                                        218, 99, 23, 1),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                }
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: ClipRect(
            //     child: Banner(
            //       message: "hello",
            //       location: BannerLocation.topEnd,
            //       color: Colors.red,
            //       child: Container(
            //         color: Colors.yellow,
            //         height: 100,
            //         child: Center(
            //           child: Text("Hello, banner!"),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<RestaurantModel> getLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final Future<RestaurantModel> data =
        sl<FoodCubit>().getRestaurants(position.latitude, position.longitude);
    return data;
  }
}
