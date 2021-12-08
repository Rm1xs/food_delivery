import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_delivery/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../injection.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //num priceResult = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<DocumentSnapshot>(
            future: sl<OrdersCubit>().getItemsInOrder(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Padding(
                    padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else {
                    Map<dynamic, dynamic> snapshotData =
                        snapshot.data!.data() as Map;
                    return SingleChildScrollView(
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshotData['orders'].length ?? 0,
                              itemBuilder: (context, i) {
                                final dynamic map = snapshotData['orders'][i];
                                final dynamic data = map.values.elementAt(0);
                                //priceResult += int.parse(data.keys.elementAt(0));
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(6.w, 3.h, 6.w, 0),
                                  child: ClayContainer(
                                    color: Colors.white,
                                    spread: 5,
                                    depth: 10,
                                    borderRadius: 20,
                                    height: 12.h,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(5.w, 1.h, 3.w, 1.h),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.network(
                                              data.values.elementAt(0),
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(3.w, 2.h, 0.w, 0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width:
                                                MediaQuery.of(context).size.width * 0.35,
                                                child: Text(
                                                  map.keys.elementAt(0),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: GoogleFonts.ptSans(
                                                    textStyle: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Waroenk kita',
                                                style: GoogleFonts.ptSans(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.sp, color: Colors.grey),
                                                ),
                                              ),
                                              Text(
                                                data.keys.elementAt(0) + ' €',
                                                style: GoogleFonts.ptSans(
                                                  textStyle: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: Colors.green,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: ElevatedButton(
                                            child: const Icon(
                                              Icons.delete_outline,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            onPressed: () => sl<OrdersCubit>().removeFromOrder(map.keys.elementAt(0)),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                              onPrimary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }
              }
            },
          ),
        ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 5,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding:
        //             const EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
        //         child: ClayContainer(
        //           color: Colors.white,
        //           spread: 5,
        //           depth: 10,
        //           borderRadius: 20,
        //           height: 9.h,
        //           width: double.infinity,
        //         ),
        //       );
        //     },
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 1.h, 6.w, 10.h),
          child: AnimatedContainerApp(),//price: priceResult,),
        )
      ],
    );
  }
}

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({Key? key}) : super(key: key);

  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 0;
  double _height = 0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  void initState() {
    super.initState();
    animateOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/PatternOrder.png'),
              fit: BoxFit.fill,
            ),
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: Stack(
            children: [
              Positioned(
                top: 3.h,
                left: 5.w,
                child: Text(
                  'Sub-Total',
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 3.h,
                right: 5.w,
                child: Text(
                  '0 €',
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6.h,
                left: 5.w,
                child: Text(
                  'Delivery Charge',
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6.h,
                right: 5.w,
                child: Text(
                  '0 €',
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 9.h,
                left: 5.w,
                child: Text(
                  'Discount',
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 9.h,
                right: 5.w,
                child: Text(
                  '0 €',
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 13.h,
                left: 5.w,
                child: Text(
                  'Total',
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              FutureBuilder<int>(
                future: sl<OrdersCubit>().getOrderPrice(),
                builder: (BuildContext context,
                    AsyncSnapshot<int> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    default:
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      else {
                        return Positioned(
                          top: 13.h,
                          right: 5.w,
                          child: Text(
                            snapshot.data.toString() + ' €',
                            //widget.price.toString(),
                            style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }
                  }
                },
              ),
              // Positioned(
              //   top: 13.h,
              //   right: 5.w,
              //   child: Text(
              //     '0',
              //     //widget.price.toString(),
              //     style: GoogleFonts.ptSans(
              //       textStyle: TextStyle(
              //         color: Colors.white,
              //         fontSize: 14.sp,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                left: 1.5.w,
                //top: 8.h,
                bottom: 1.h,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 6.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () => {print('tap')},
                    child: const Text(
                      'Place My Order',
                      style: TextStyle(
                          color: Color.fromRGBO(83, 232, 139, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void animateOrder() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () => setState(() {
        _width = MediaQuery.of(context).size.width;
        _height = MediaQuery.of(context).size.height * 0.25;
        _color = Colors.green;
        _borderRadius = BorderRadius.circular(10);
      }),
    );
  }
}

//PatternOrder.png
