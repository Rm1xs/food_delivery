import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_events.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sizer/sizer.dart';
import '../../injection.dart';
import 'complete_payment_page.dart';

class CompleteRegistration extends StatefulWidget {
  const CompleteRegistration({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CompleteRegistration());

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CompleteRegistration());
  }
  @override
  State<CompleteRegistration> createState() => _CompleteRegistrationState();
}

class _CompleteRegistrationState extends State<CompleteRegistration> {
  //Get current user and Firebase instance
  FirebaseAuth _auth = FirebaseAuth.instance;

  //Phone number refactor mask
  var maskFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-###', filter: {"#": RegExp(r'[0-9]')});

  //Controllers
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  //Variables
  String verificationId = '';
  late bool showSmsEnterField;

  //Padding size when textfield hidden
  int size = 0;

  //Show phone TextField or Hide
  @override
  void initState() {
    if (_auth.currentUser != null) {
      if (_auth.currentUser!.phoneNumber != null) {
        showSmsEnterField = false;
        size = 30;
        Future(() {
          Navigator.push(context, MaterialPageRoute(builder: (_) => CompletePaymentPage()));
        });
      } else {
        showSmsEnterField = true;
        size = 20;
      }
    } else {
      showSmsEnterField = true;
      size = 20;
    }


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            _auth.currentUser!.email ?? 'Unknown error, try re-login',
            style: TextStyle(color: Colors.black, fontSize: 12.sp),
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
                  color: const Color.fromRGBO(218, 99, 23, 1).withOpacity(1),
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
                    height: 8.h,
                    child: TextField(
                      controller: nameController,
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
                          hintText: _auth.currentUser!.displayName,
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                  child: SizedBox(
                    height: 8.h,
                    child: TextField(
                      controller: surnameController,
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
                          hintText: _auth.currentUser!.displayName,
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                ),
                Visibility(
                  visible: showSmsEnterField,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                    child: SizedBox(
                      height: 8.h,
                      child: TextField(
                        controller: phoneController,
                        inputFormatters: [maskFormatter],
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () => {getSms()},
                              icon: const Icon(Icons.send),
                            ),
                            labelText: 'Phone',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, size.h, 0, 0),
                  child: Center(
                    child: Container(
                      height: 7.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 5.0)
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                          colors: [
                            Color.fromRGBO(83, 232, 139, 1),
                            Color.fromRGBO(21, 190, 119, 1),
                          ],
                        ),
                        color: Colors.deepPurple.shade300,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () async {
                          if(nameController.text.isNotEmpty && surnameController.text.isNotEmpty) {
                            await _auth.currentUser?.updateDisplayName(
                                nameController.text.trim() +
                                    ' ' +
                                    surnameController.text.trim());
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CompletePaymentPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            'Next',
                            style: GoogleFonts.ptSans(
                              textStyle: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
      verificationCompleted: (phoneAuthCredential) async {
        setState(() {
          showSmsEnterField = false;
        });
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text("Enter SMS Code"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: otpController,
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text("Done"),
                textColor: Colors.white,
                color: Colors.redAccent,
                onPressed: () async {
                  smsCode = otpController.text.trim();

                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: smsCode);
                  await _auth.currentUser
                      ?.updatePhoneNumber(credential);
                  if(_auth.currentUser!.phoneNumber!.isNotEmpty){
                    setState(() {
                      showSmsEnterField = false;
                      size = 30;
                    });
                  }
                  else{
                    setState(() {
                      showSmsEnterField = true;
                      size = 20;
                    });
                  }
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }
}
