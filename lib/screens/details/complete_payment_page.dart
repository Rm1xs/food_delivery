import 'package:clay_containers/widgets/clay_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_events.dart';
import 'package:food_delivery/features/food/presentation/screen/food_main_navigation.dart';
import 'package:food_delivery/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../features/payment/presentation/screen/add_payment_page.dart';
import '../../injection.dart';

class CompletePaymentPage extends StatefulWidget {
  const CompletePaymentPage({Key? key}) : super(key: key);

  @override
  State<CompletePaymentPage> createState() => _CompletePaymentPageState();
}

class _CompletePaymentPageState extends State<CompletePaymentPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> card = sl<PaymentCubit>().checkCard();

  @override
  void initState() {
    super.initState();
  }

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
                _auth.currentUser?.email ?? 'Unknown error, try re-login',
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
              Text(
                _auth.currentUser?.displayName ?? 'Set name and surname',
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
                  onPressed: () =>
                      sl<AuthenticationBloc>().add(AppLogoutRequested()),
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
                FutureBuilder<bool>(
                  future: sl<PaymentCubit>().checkCard(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    switch (snapshot.connectionState) {
                      default:
                        if (snapshot.data == true) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                            child: Column(
                              children: [
                                Text(
                                  'Card already exist, add new ?',
                                  style: GoogleFonts.ptSans(
                                    textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color:
                                          const Color.fromRGBO(218, 99, 23, 1),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => {
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const FoodMainNavigation(),
                                      ),
                                    ),
                                  },
                                  child: const Text('Go to app'),
                                ),
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
                          );
                        }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
