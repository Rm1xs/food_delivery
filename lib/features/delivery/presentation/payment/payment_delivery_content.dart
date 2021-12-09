import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:food_delivery/features/payment/presentation/screen/add_payment_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../injection.dart';

class PaymentDeliveryContent extends StatelessWidget {
  PaymentDeliveryContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: GoogleFonts.ptSans(
              textStyle:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<bool>(
            future: sl<PaymentCubit>().checkCard(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              switch (snapshot.connectionState) {
                default:
                  if (snapshot.data == true) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                      child: Column(
                        children: [
                          FutureBuilder<String>(
                            future: sl<PaymentCubit>().getCard(), // async work
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return CircularProgressIndicator();
                                default:
                                  if (snapshot.hasError)
                                    return Text('Error: ${snapshot.error}');
                                  else
                                    return Column(
                                      children: [
                                        ClayContainer(
                                          color: Colors.lightBlueAccent,
                                          spread: 0,
                                          depth: 10,
                                          borderRadius: 20,
                                          child: SizedBox(
                                            height: 8.h,
                                            width: double.infinity,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5.w, 1.h, 2.w, 1.h),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    child: Image.asset(
                                                      'assets/images/visa.png',
                                                      // width: 17.w,
                                                      // height: 9.h,
                                                      fit: BoxFit.scaleDown,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      child: Text(
                                                        snapshot.data
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.ptSans(
                                                          textStyle: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   snapshot.data!.hits[index]
                                                    //       .recipe.dish[0],
                                                    //   style: GoogleFonts.ptSans(
                                                    //     textStyle: TextStyle(
                                                    //         fontSize: 11.sp,
                                                    //         color: Colors.grey),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                                          child: ClayContainer(
                                            color: Colors.grey,
                                            spread: 0,
                                            depth: 10,
                                            borderRadius: 20,
                                            child: SizedBox(
                                              height: 8.h,
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5.w, 1.h, 2.w, 1.h),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      child: Image.asset(
                                                        'assets/images/visa.png',
                                                        // width: 17.w,
                                                        // height: 9.h,
                                                        fit: BoxFit.scaleDown,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        child: Text(
                                                          'Add new card',
                                                          style: GoogleFonts
                                                              .ptSans(
                                                            textStyle: TextStyle(
                                                                fontSize: 11.sp,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   snapshot.data!.hits[index]
                                                      //       .recipe.dish[0],
                                                      //   style: GoogleFonts.ptSans(
                                                      //     textStyle: TextStyle(
                                                      //         fontSize: 11.sp,
                                                      //         color: Colors.grey),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                  // Icon(Icons.check, color: Colors.white,)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                              }
                            },
                          ),
                          // Text(
                          //   'Card already exist, add new ?',
                          //   style: GoogleFonts.ptSans(
                          //     textStyle: TextStyle(
                          //       fontSize: 12.sp,
                          //       color:
                          //       const Color.fromRGBO(218, 99, 23, 1),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AddPaymentPage()));
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                          child: ClayContainer(
                            color: Colors.grey,
                            spread: 0,
                            depth: 10,
                            borderRadius: 20,
                            child: SizedBox(
                              height: 8.h,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(5.w, 1.h, 2.w, 1.h),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.asset(
                                        'assets/images/visa.png',
                                        // width: 17.w,
                                        // height: 9.h,
                                        fit: BoxFit.scaleDown,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Text(
                                          'Add new card',
                                          style: GoogleFonts.ptSans(
                                            textStyle: TextStyle(
                                                fontSize: 11.sp,
                                                color: Colors.white),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      // Text(
                                      //   snapshot.data!.hits[index]
                                      //       .recipe.dish[0],
                                      //   style: GoogleFonts.ptSans(
                                      //     textStyle: TextStyle(
                                      //         fontSize: 11.sp,
                                      //         color: Colors.grey),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  // Icon(Icons.check, color: Colors.white,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
