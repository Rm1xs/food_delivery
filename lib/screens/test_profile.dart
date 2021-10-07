import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_events.dart';
import 'package:food_delivery/features/auth/presentation/widgets/green_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';
import '../injection.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var maskFormatter = MaskTextInputFormatter(mask: '+# (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') });
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  bool showVerificationCodeWidget = false;

  String verificationId = '';

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(
                user.email ?? '',
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
              Text(
                user.id,
                style: TextStyle(fontSize: 6.sp, color: Colors.black),
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
                  color: Color.fromRGBO(249, 168, 77, 1)
                      .withOpacity(0.5), //Colors.white.withOpacity(0.5),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.logout,
                  ),
                  color: Color.fromRGBO(218, 99, 23, 1),
                  onPressed: () =>
                      sl<AuthenticationBloc>().add(AppLogoutRequested()),
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
                  'Fill in your bio to get\nstarted',
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
                  padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                  child: SizedBox(
                    height: 7.h,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 0.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Name',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                  child: SizedBox(
                    height: 7.h,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 0.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'Surname',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                  child: SizedBox(
                    height: 7.h,
                    child: TextField(
                      controller: phoneController,
                      // keyboardType: TextInputType.phone,
                      // inputFormatters: <TextInputFormatter>[
                      //   FilteringTextInputFormatter.digitsOnly
                      // ],
                      //maxLength: 12,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey, width: 0.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () => {
                            getSms()
                          },
                            icon: Icon(Icons.send),
                          ),
                          labelText: 'Phone',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                    child: SizedBox(
                      height: 7.h,
                      child: TextField(
                        controller: otpController,
                        // keyboardType: TextInputType.phone,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        //maxLength: 12,
                        inputFormatters: [
                          maskFormatter
                        ],
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.blueAccent, width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            border: const OutlineInputBorder(),

                            labelText: 'OTP',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                  ),
                //Text('* Input correct phone number!', style: TextStyle(fontSize: 9.sp,),),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                  child: const Center(
                      child: GreenButton(
                        redirectToRoute: 'test',
                        text: 'Next',
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  void getSms() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      timeout: const Duration(seconds: 15),
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          showVerificationCodeWidget = true;
        });
        String smsCode = otpController.text;

        //PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

        await _auth.applyActionCode(smsCode);
      },
      verificationCompleted: (phoneAuthCredential) async {
        setState(() {
          print('complete');
          showLoading = false;
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        setState(() {
          showLoading = false;
        });
        // Handle other errors
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }


}
