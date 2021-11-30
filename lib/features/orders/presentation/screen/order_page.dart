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
                    child: const Center(child: CircularProgressIndicator()),
                  );
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else {
                    final Map<dynamic, dynamic> snapshotData =
                        snapshot.data!.data() as Map;
                    return Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshotData['orders'].length ?? 0,
                            itemBuilder: (BuildContext context, int i) {
                              final Map<dynamic, dynamic> map = snapshotData['orders'][i];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 12.0, right: 12.0),
                                child: ClayContainer(
                                  color: Colors.white,
                                  spread: 5,
                                  depth: 10,
                                  borderRadius: 20,
                                  height: 9.h,
                                  width: double.infinity,
                                  child: Center(child: Text(map.values.elementAt(0))),
                                ),
                              );
                            },
                          ),
                        )
                      ],
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
          child: const AnimatedContainerApp(),
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
                  '120 €',
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
                  '10 €',
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
                  '20 €',
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
              Positioned(
                top: 13.h,
                right: 5.w,
                child: Text(
                  '150 €',
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
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
