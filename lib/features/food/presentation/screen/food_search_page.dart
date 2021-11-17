import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:food_delivery/features/food/presentation/cubit/food_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../injection.dart';
import 'food_details/food_details_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController controller = TextEditingController();
  late Future<FoodModel> data;
  bool isSearchAllowed = true;

  @override
  void initState() {
    data = sl<FoodCubit>().getFood('pizza');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'search',
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            autofocus: false,
                            decoration: InputDecoration(
                              prefixIcon: IconTheme(
                                data: IconThemeData(
                                  color: const Color.fromRGBO(218, 99, 23, 1)
                                      .withOpacity(1),
                                ),
                                child: const Icon(Icons.create_outlined),
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
                              contentPadding: const EdgeInsets.all(10.0),
                              fillColor: const Color.fromRGBO(218, 99, 23, 1)
                                  .withOpacity(0.08),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.w, 0, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(218, 99, 23, 1)
                                    .withOpacity(0.08),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: const Color.fromRGBO(218, 99, 23, 1)
                                      .withOpacity(1),
                                ),
                                onPressed: () {
                                  setState(() {
                                    data = sl<FoodCubit>()
                                        .getFood(controller.text);
                                  });
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(7.w, 3.h, 0.w, 0),
                  child: Text(
                    'Popular Menu',
                    style: GoogleFonts.ptSans(
                      textStyle: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 11.h),
                  child: FutureBuilder<FoodModel>(
                    future: data, // async work
                    builder: (BuildContext context,
                        AsyncSnapshot<FoodModel> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: Column(
                              children: [
                                const CircularProgressIndicator(
                                  color: Color.fromRGBO(218, 99, 23, 1),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                                  child: Text(
                                    'Loading...',
                                    style: GoogleFonts.ptSans(
                                      textStyle: TextStyle(
                                          color: const Color.fromRGBO(
                                                  218, 99, 23, 1)
                                              .withOpacity(0.5),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
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
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => FoodDetailsPage(data: snapshot.data!.hits[index].recipe,),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              6.w, 2.h, 6.w, 0),
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
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5.w, 1.h, 0, 1.h),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      child: Image.network(
                                                        snapshot
                                                            .data!
                                                            .hits[index]
                                                            .recipe
                                                            .image,
                                                        // width: 17.w,
                                                        // height: 9.h,
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            6.w, 3.h, 0.w, 0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                          child: Text(
                                                            snapshot
                                                                .data!
                                                                .hits[index]
                                                                .recipe
                                                                .label,
                                                            style: GoogleFonts
                                                                .ptSans(
                                                              textStyle: TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .hits[index]
                                                              .recipe
                                                              .dish[0],
                                                          style: GoogleFonts
                                                              .ptSans(
                                                            textStyle: TextStyle(
                                                                fontSize: 11.sp,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // Padding(
                                                  //   padding: EdgeInsets.fromLTRB(
                                                  //       0.w, 0.h, 0.w, 0),
                                                  //   child: Text(
                                                  //     '7€',
                                                  //     style: GoogleFonts.ptSans(
                                                  //       textStyle: TextStyle(
                                                  //         fontSize: 18.sp,
                                                  //         fontWeight: FontWeight.bold,
                                                  //         color: const Color.fromRGBO(
                                                  //             218, 99, 23, 1),
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // )
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {
      if(controller.text.isNotEmpty) {
        data = sl<FoodCubit>().getFood(controller.text);
      }
    });
  }
}
