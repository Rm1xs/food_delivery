import 'dart:async';

import 'package:food_delivery/features/food/presentation/cubit/food_cubit.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../../injection.dart';

class FoodDetailsPage extends StatelessWidget {
  FoodDetailsPage({Key? key, required this.data}) : super(key: key);
  RecipeClassModel? data;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 300,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(100, 100, 100, 100),
                child: Image.network(
                  data!.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.6,
                maxChildSize: 0.9,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(83, 232, 139, 1)
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                                    child: Text(
                                      'Popular',
                                      style: GoogleFonts.ptSans(
                                        color: const Color.fromRGBO(
                                            83, 232, 139, 1),
                                        textStyle: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 0.h),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.greenAccent
                                              .withOpacity(0.2)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.location_on,
                                          size: 20,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(2.w, 0, 0, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            color: Colors.redAccent
                                                .withOpacity(0.2)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: InkWell(
                                            onTap: () => _doSomething(),
                                            child: const Icon(
                                              Icons.local_fire_department,
                                              size: 20,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 5.h, 6.w, 0),
                            child: Text(
                              data!.label,
                              style: GoogleFonts.ptSans(
                                color: Colors.black,
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 3.h, 6.w, 0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star_half_sharp,
                                  size: 20,
                                  color: Colors.greenAccent,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(1.w, 0, 0, 0),
                                  child: Text(
                                    '4,8 Rating',
                                    style: GoogleFonts.ptSans(
                                      textStyle: TextStyle(
                                          fontSize: 11.sp, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                                  child: const Icon(
                                    Icons.shop,
                                    size: 20,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(1.w, 0, 0, 0),
                                  child: Text(
                                    '2000+ Order',
                                    style: GoogleFonts.ptSans(
                                      textStyle: TextStyle(
                                          fontSize: 11.sp, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                                  child: const Icon(
                                    Icons.fastfood,
                                    size: 20,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(1.w, 0, 0, 0),
                                  child: Text(
                                    data!.calories.toInt().toString() +
                                        ' Calories',
                                    style: GoogleFonts.ptSans(
                                      textStyle: TextStyle(
                                          fontSize: 11.sp, color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 5.h, 6.w, 0),
                            child: Text(
                              'Composition',
                              style: GoogleFonts.ptSans(
                                color: Colors.black,
                                textStyle: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(6.w, 3.h, 6.w, 10.h),
                                  child: ListView.builder(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: data!.ingredientLines.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 1.h),
                                        child: Text(
                                          data!.ingredientLines[index],
                                          style: GoogleFonts.lato(
                                            color: Colors.black,
                                            textStyle: TextStyle(
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 85.h,
              bottom: 2.h,
              left: 4.w,
              right: 4.w,
              child: RoundedLoadingButton(
                resetAfterDuration: true,
                color: Colors.green,
                borderRadius: 12,
                //width: double.maxFinite,
                child: Text('Add ${data!.label} To Chart',
                    style: TextStyle(color: Colors.white)),
                controller: _btnController,
                onPressed: () => _doSomething(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _doSomething() async {
    sl<FoodCubit>()
        .addToFavourite(data!.label, data!.image)
        .whenComplete(() => _btnController.success());
  }
}
