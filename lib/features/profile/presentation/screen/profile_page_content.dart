import 'package:camera/camera.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/core/default/ui_elements/curve_painter.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_events.dart';
import 'package:food_delivery/features/delivery/domain/usecases/delivery_usecase_implemeentation.dart';
import 'package:food_delivery/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:food_delivery/screens/profile_photo/profile_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../../injection.dart';

class ProfilePageContent extends StatefulWidget {
  const ProfilePageContent({Key? key}) : super(key: key);

  @override
  State<ProfilePageContent> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageContent> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late CameraDescription camera;
  late int favouriteElements;
  late String favouriteText;
  final GlobalKey<State<StatefulWidget>> dataKey = GlobalKey();
  late Future<String> data;

  @override
  void initState() {
    favouriteElements = 2;
    favouriteText = 'Show all favourites';
    _getCamera();
    data = sl<ProfileCubit>().getProfileImage();
    super.initState();
  }

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
        final Map<dynamic, dynamic> snapshotData = snapshot.data!.data() as Map;
        final String withoutSign =
            snapshotData['subscription'].replaceAll(RegExp('_'), ' ');
        return Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 150,
              left: 0,
              right: 0,
              child: Container(
                  color: const Color.fromARGB(100, 100, 100, 100),
                  child: FutureBuilder<String>(
                    key: dataKey,
                    future: data, // async work
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Text('Loading....');
                        default:
                          if (snapshot.hasError)
                            return Image.network(
                              'https://images.unsplash.com/photo-1531306728370-e2ebd9d7bb99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                              fit: BoxFit.fill,
                            );
                          else
                            return Image.network(
                              snapshot.data ??
                                  'https://images.unsplash.com/photo-1531306728370-e2ebd9d7bb99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                              fit: BoxFit.fill,
                            );
                      }
                    },
                  )),
            ),
            Positioned(
              top: 15,
              left: 360,
              right: 5,
              child: InkWell(
                onTap: () => Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileImage(
                      camera: camera,
                    ),
                  ),
                ),
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
                builder:
                    (BuildContext context, ScrollController scrollController) {
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
                                size: const Size(120, 4),
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
                                padding:
                                    EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                                child: Text(
                                  withoutSign,
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
                                  _auth.currentUser?.displayName ?? 'Unknown',
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
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                                  child: const Icon(
                                    Icons.settings,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () => sl<AuthenticationBloc>()
                                        .add(AppLogoutRequested()),
                                    child: const Icon(
                                      Icons.logout,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 1.h, 6.w, 0),
                            child: Text(
                              _auth.currentUser?.email ?? 'Unknown',
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
                                    padding:
                                        EdgeInsets.fromLTRB(5.w, 0, 3.w, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.asset(
                                        'assets/images/VoucherIcon.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'You Have ${snapshotData['vouchers']} Voucher',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0),
                                child: Text(
                                  'My Favorite',
                                  style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 2.h, 6.w, 0),
                                child: InkWell(
                                  onTap: () => setState(() {
                                    if (favouriteElements == 2) {
                                      favouriteElements = 10;
                                      favouriteText = 'Hide favourites';
                                    } else {
                                      favouriteElements = 2;
                                      favouriteText = 'Show all favourites';
                                    }
                                  }),
                                  child: Text(
                                    favouriteText,
                                    style: GoogleFonts.ptSans(
                                      textStyle: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color.fromRGBO(
                                            218, 99, 23, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          favourite(snapshotData),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 0.h),
                            child: Text(
                              'My Orders',
                              style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          orders(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 12.h),
                            child: Container(
                              height: 15.h,
                              width: double.infinity,
                              child: const Image(
                                image: AssetImage('assets/images/delivery.png'),
                                fit: BoxFit.scaleDown,
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
      },
    );
  }

  Widget orders() {
    return FutureBuilder(
      future: sl<DeliveryUseCaseImplementation>().getDelivery(),
      builder: (
        BuildContext context,
        AsyncSnapshot snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            final Map<dynamic, dynamic> snapshotData =
                snapshot.data!.data() as Map;
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
                          'https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg',
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
                              snapshotData.values.elementAt(1),
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
                  ],
                ),
              ),
            );
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
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
            child: snapshotData['favourite'].isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 15.h,
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage('assets/images/delivery.png'),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshotData['favourite'].length == null
                        ? 0
                        : (snapshotData['favourite'].length > favouriteElements
                            ? favouriteElements
                            : snapshotData['favourite'].length),
                    itemBuilder: (BuildContext context, int index) {
                      final Map<dynamic, dynamic> map =
                          snapshotData['favourite'][index];
                      return Dismissible(
                        dragStartBehavior: DragStartBehavior.start,
                        key: Key(map.keys.elementAt(0)),
                        direction: DismissDirection.endToStart,
                        background: Padding(
                          padding: EdgeInsets.fromLTRB(6.w, 3.h, 6.w, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              color: Colors.deepOrange,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const <Widget>[
                                    Icon(Icons.delete, color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        confirmDismiss: (DismissDirection direction) async {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Delete Confirmation'),
                                content: const Text(
                                    'Are you sure you want to delete this item?'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text('Delete')),
                                  FlatButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.endToStart) {
                            print('removed');
                          }
                        },
                        child: Padding(
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
                                  padding:
                                      EdgeInsets.fromLTRB(5.w, 1.h, 3.w, 1.h),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      map.values.elementAt(0),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(3.w, 2.h, 0.w, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
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
                                  padding:
                                      EdgeInsets.fromLTRB(0.w, 0.h, 5.w, 0.h),
                                  child: ElevatedButton(
                                    child: const Text('Buy'),
                                    onPressed: () => print("it's pressed"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
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

  //Methods
  void _getCamera() async => await availableCameras()
      .then((List<CameraDescription> value) => camera = value.first);
}
