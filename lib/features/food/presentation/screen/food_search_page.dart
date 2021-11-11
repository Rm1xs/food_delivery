import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:food_delivery/features/food/presentation/cubit/food_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../injection.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController controller = TextEditingController();
  late Future<FoodModel> data;

  @override
  void initState() {
    data = sl<FoodCubit>().getFood('soup');
    super.initState();
  }

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
                    controller: controller,
                    onChanged: (String value) {
                      setState(() {
                        data = sl<FoodCubit>().getFood(value);
                      });
                      // BlocProvider.of<RecipeBloc>(context).add(GetRecipe(value));
                      // Future<void>.delayed(const Duration(milliseconds: 500),
                      //         () => isSearchAllowed = true);
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
                      fillColor: const Color.fromRGBO(218, 99, 23, 1)
                          .withOpacity(0.08),
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
              FutureBuilder<FoodModel>(
                future: data, // async work
                builder:
                    (BuildContext context, AsyncSnapshot<FoodModel> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Text('Loading....');
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
                                  return Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
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
                                              padding: EdgeInsets.fromLTRB(
                                                  5.w, 0, 0, 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                child: Image.network(
                                                  snapshot.data!.hits[index]
                                                      .recipe.image,
                                                  // width: 17.w,
                                                  // height: 9.h,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  6.w, 3.h, 0.w, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data!.hits[index]
                                                        .recipe.label,
                                                    style: GoogleFonts.ptSans(
                                                      textStyle: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Warung Herbal',
                                                    style: GoogleFonts.ptSans(
                                                      textStyle: TextStyle(
                                                          fontSize: 11.sp,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: EdgeInsets.fromLTRB(
                                            //       20.w, 0.h, 0.w, 0),
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
            ],
          ),
        ),
      ),
    );
  }
}
