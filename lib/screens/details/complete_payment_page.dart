import 'package:clay_containers/widgets/clay_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'add_payment_page.dart';

class CompletePaymentPage extends StatelessWidget {
  CompletePaymentPage({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(
                right: 10.0, top: 10.0, bottom: 10.0, left: 10),
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromRGBO(249, 168, 77, 1)
                    .withOpacity(0.2), //Colors.white.withOpacity(0.5),
              ),
              child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  color: const Color.fromRGBO(218, 99, 23, 1),
                  onPressed: () => {Navigator.of(context).pop()}
                  // sl<AuthenticationBloc>().add(AppLogoutRequested()),
                  ),
            ),
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                _auth.currentUser!.email ?? 'Unknown error, try re-login',
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
              Text(
                _auth.currentUser?.displayName ?? 'Set phone number',
                style: TextStyle(
                    fontSize: 8.sp,
                    color: const Color.fromRGBO(249, 168, 77, 1)),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, top: 10.0, bottom: 10.0, left: 10),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromRGBO(249, 168, 77, 1)
                      .withOpacity(0.2), //Colors.white.withOpacity(0.5),
                ),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.logout,
                    ),
                    color: const Color.fromRGBO(218, 99, 23, 1),
                    onPressed: () => {}
                    // sl<AuthenticationBloc>().add(AppLogoutRequested()),
                    ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.h),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                  child: Text(
                    'This data will be displayed in your account\nprofile for security',
                    style: GoogleFonts.ptSans(
                      textStyle: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AddPaymentPage()));
                    },
                    child: ClayContainer(
                      borderRadius: 20,
                      depth: 8,
                      spread: 8,
                      child: SizedBox(
                        height: 12.h,
                        width: double.infinity,
                        child: Image.asset('assets/images/visa.png'),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                //   child: InkWell(
                //     onTap: () {
                //       print("Tapped on container");
                //     },
                //     child: Container(
                //       height: 12.h,
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: const BorderRadius.only(
                //             topLeft: Radius.circular(10),
                //             topRight: Radius.circular(10),
                //             bottomLeft: Radius.circular(10),
                //             bottomRight: Radius.circular(10)
                //         ),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 1,
                //             blurRadius: 7,
                //             offset: const Offset(0, 1), // changes position of shadow
                //           ),
                //         ],
                //       ),
                //       child: Image.asset('assets/images/visa.png', color: Colors.grey,),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                //   child: InkWell(
                //     onTap: () {
                //       print("Tapped on container");
                //     },
                //     child: Container(
                //       height: 12.h,
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: const BorderRadius.only(
                //             topLeft: Radius.circular(10),
                //             topRight: Radius.circular(10),
                //             bottomLeft: Radius.circular(10),
                //             bottomRight: Radius.circular(10)
                //         ),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 1,
                //             blurRadius: 7,
                //             offset: const Offset(0, 1), // changes position of shadow
                //           ),
                //         ],
                //       ),
                //       child: Image.asset('assets/images/visa.png', color: Colors.grey,),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                //   child: Center(
                //     child: Container(
                //       height: 7.h,
                //       width: 40.w,
                //       decoration: BoxDecoration(
                //         boxShadow: const [
                //           BoxShadow(
                //               color: Colors.black26,
                //               offset: Offset(0, 4),
                //               blurRadius: 5.0)
                //         ],
                //         gradient: const LinearGradient(
                //           begin: Alignment.topLeft,
                //           end: Alignment.bottomRight,
                //           stops: [0.0, 1.0],
                //           colors: [
                //             Color.fromRGBO(83, 232, 139, 1),
                //             Color.fromRGBO(21, 190, 119, 1),
                //           ],
                //         ),
                //         color: Colors.deepPurple.shade300,
                //         borderRadius: BorderRadius.circular(13),
                //       ),
                //       child: ElevatedButton(
                //         style: ButtonStyle(
                //           shape:
                //           MaterialStateProperty.all<RoundedRectangleBorder>(
                //             RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(13),
                //             ),
                //           ),
                //           backgroundColor:
                //           MaterialStateProperty.all(Colors.transparent),
                //           shadowColor:
                //           MaterialStateProperty.all(Colors.transparent),
                //         ),
                //         onPressed: ()  {},
                //         child: Padding(
                //           padding: const EdgeInsets.only(
                //             top: 10,
                //             bottom: 10,
                //           ),
                //           child: Text(
                //             'Next',
                //             style: GoogleFonts.ptSans(
                //               textStyle: TextStyle(
                //                 fontSize: 11.sp,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
