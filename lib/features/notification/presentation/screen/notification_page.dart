import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:food_delivery/screens/appbar/appbar_with_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../injection.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbarWithButton('Notification', false, context),
        body: FutureBuilder<DocumentSnapshot>(
          future: sl<NotificationCubit>().getNotifications(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
                          itemCount: snapshotData['history'].length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final Map<dynamic, dynamic> map =
                                snapshotData['history'][index];
                            return Padding(
                              padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
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
                                        padding:
                                            EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.asset(
                                            'assets/images/SuccessIcon.png',
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
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                map.values.elementAt(0),
                                                maxLines: 1,
                                                overflow: TextOverflow.clip,
                                                softWrap: false,
                                                style: GoogleFonts.ptSans(
                                                  textStyle: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              map.values.elementAt(1),
                                              style: GoogleFonts.ptSans(
                                                textStyle: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
    );
  }
}
