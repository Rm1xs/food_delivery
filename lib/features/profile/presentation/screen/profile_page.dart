import 'package:camera/camera.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/core/default/curve_painter.dart';
import 'package:food_delivery/screens/profile_photo/profile_image_camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void getCamera() async {
    await availableCameras().then((value) => camera = value.first);
  }

  late CameraDescription camera;

  @override
  void initState() {
    getCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 150,
          left: 0,
          right: 0,
          child: Container(
            color: const Color.fromARGB(100, 100, 100, 100),
            child: Image.network(
              'https://images.unsplash.com/photo-1531306728370-e2ebd9d7bb99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 360,
          right: 5,
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProfileImagePage(
                          camera: camera,
                        ))),
            child: const Icon(
              Icons.upload_outlined,
              size: 20,
              color: Colors.green,
            ),
          ),
        ),
        SizedBox.expand(
          child: DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                //color: Colors.white,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 2.h, 0.w, 0),
                        child: Center(
                          child: CustomPaint(
                            size: Size(120, 4),
                            painter: CurvePainter(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 5.h, 6.w, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(218, 99, 23, 1)
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                            child: Text(
                              'Member Gold',
                              style: GoogleFonts.ptSans(
                                color: const Color.fromRGBO(218, 99, 23, 1),
                                textStyle: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                        child: Row(
                          children: [
                            Text(
                              'Nikita Kartashov',
                              style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 1.h, 6.w, 0),
                        child: Text(
                          'neket45786@gmail.com',
                          style: GoogleFonts.ptSans(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 3.h, 6.w, 0),
                        child: ClayContainer(
                          color: Colors.white,
                          spread: 5,
                          depth: 10,
                          borderRadius: 20,
                          height: 7.h,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/images/VoucherIcon.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text(
                                'You Have 3 Voucher',
                                style: GoogleFonts.ptSans(
                                  textStyle: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                        child: Text(
                          'My Favorite',
                          style: GoogleFonts.ptSans(
                            textStyle: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
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
                                padding: EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/images/PhotoMenu.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(3.w, 2.h, 6.w, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spacy fresh crab',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Waroenk kita',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      '35',
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
                                  child: const Text('Buy Again'),
                                  onPressed: () => print("it's pressed"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
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
                                padding: EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/images/PhotoMenu.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(3.w, 2.h, 6.w, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spacy fresh crab',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Waroenk kita',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      '35',
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
                                  child: const Text('Buy Again'),
                                  onPressed: () => print("it's pressed"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
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
                                padding: EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/images/PhotoMenu.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(3.w, 2.h, 6.w, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spacy fresh crab',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Waroenk kita',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      '35',
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
                                  child: const Text('Buy Again'),
                                  onPressed: () => print("it's pressed"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
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
                                padding: EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/images/PhotoMenu.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(3.w, 2.h, 6.w, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spacy fresh crab',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Waroenk kita',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      '35',
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
                                  child: const Text('Buy Again'),
                                  onPressed: () => print("it's pressed"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.w, 3.h, 6.w, 10.h),
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
                                padding: EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    'assets/images/PhotoMenu.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(3.w, 2.h, 6.w, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spacy fresh crab',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'Waroenk kita',
                                      style: GoogleFonts.ptSans(
                                        textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      '35',
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
                                  child: const Text('Buy Again'),
                                  onPressed: () => print("it's pressed"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
