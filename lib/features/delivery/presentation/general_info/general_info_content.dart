import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../injection.dart';

class GeneralInfoContent extends StatefulWidget {
  GeneralInfoContent({Key? key}) : super(key: key);

  @override
  State<GeneralInfoContent> createState() => _GeneralInfoContentState();
}

class _GeneralInfoContentState extends State<GeneralInfoContent> {
  @override
  void initState() {
    displayName.text = _auth.currentUser?.displayName ?? 'Unknown';
    email.text = _auth.currentUser?.email ?? 'Unknown';
    phone.text = _auth.currentUser?.phoneNumber ?? 'Unknown';
    super.initState();
  }

  TextEditingController displayName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl<ProfileCubit>().getProfile(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(218, 99, 23, 1),
                ),
              ),
            ],
          );
        }
        Map<dynamic, dynamic> snapshotData = snapshot.data!.data() as Map;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'User name',
                  style: GoogleFonts.ptSans(
                    textStyle:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                controller: displayName,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Email',
                  style: GoogleFonts.ptSans(
                    textStyle:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                controller: email,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Phone number',
                  style: GoogleFonts.ptSans(
                    textStyle:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                controller: phone,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Address',
                  style: GoogleFonts.ptSans(
                    textStyle:
                    TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(),
              favourite(snapshotData),
            ],
          ),
        );
      },
    );
  }

  Widget favourite(Map<dynamic, dynamic> snapshotData) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 3.h),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshotData['orders'].length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final Map<dynamic, dynamic> orders =
                    snapshotData['orders'][index];
                final String name = orders.keys.elementAt(0);

                final Map<dynamic, dynamic> image = orders.values.elementAt(0);

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
                              image.values.elementAt(0),
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
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Text(
                                  name,
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
                                'Some info',
                                style: GoogleFonts.ptSans(
                                  textStyle: TextStyle(
                                      fontSize: 10.sp, color: Colors.grey),
                                ),
                              ),
                              Text(
                                '20',
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
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
