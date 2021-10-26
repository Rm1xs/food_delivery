import 'package:clay_containers/widgets/clay_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/core/validation/card_number.dart';
import 'package:food_delivery/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:food_delivery/features/payment/presentation/widgets/bottom_card_decoration_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../injection.dart';

class AddPaymentPage extends StatefulWidget {
  AddPaymentPage({Key? key}) : super(key: key);

  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final numberController = TextEditingController();
  final holderController = TextEditingController();
  final dateController = TextEditingController();
  final cvvController = TextEditingController();

  String number = '';
  String holder = '';
  String date = '';
  String cvv = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: Column(
            children: [
              SizedBox(
                height: 33.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4.h, 2.h, 4.h, 4.h),
                  child: ClayContainer(
                    color: Colors.grey[700],
                    borderRadius: 20,
                    depth: 5,
                    spread: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              'assets/images/mastercard.png',
                              height: 5.h,
                              width: 5.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.h, 4.h, 2.h, 0),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              number,
                              style: GoogleFonts.inconsolata(
                                textStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const BottomCardDecoration(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.h, 1.h, 2.h, 0),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  holder,
                                  style: GoogleFonts.inconsolata(
                                    textStyle: TextStyle(
                                        fontSize: 11.sp, color: Colors.white),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                date,
                                style: GoogleFonts.inconsolata(
                                  textStyle: TextStyle(
                                      fontSize: 11.sp, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(4.h, 0, 4.h, 0),
                child: SizedBox(
                  height: 8.h,
                  child: TextField(
                    inputFormatters: [
                      CardNumberFormatter(
                          separator: ' ', mask: 'xxxx xxxx xxxx xxxx')
                    ],
                    //maxLength: 19,
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      setState(() {
                        number = numberController.text;
                      });
                    },
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
                        labelText: 'Card Number',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(4.h, 2.h, 4.h, 0),
                child: SizedBox(
                  height: 8.h,
                  child: TextField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Select Year"),
                          content: Container(
                            // Need to use container to add size constraint.
                            width: 300,
                            height: 300,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (DateTime value) {
                                setState(() {
                                  date = '${value.month}/${value.year}';
                                  dateController.text = date;
                                });
                              },
                              minimumYear: 2010,
                              maximumYear: 2030,
                              initialDateTime: DateTime.now(),
                              mode: CupertinoDatePickerMode.date,
                            ),
                          ),
                        );
                      },
                    ),
                    keyboardType: TextInputType.datetime,
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
                        labelText: 'Date',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(4.h, 2.h, 4.h, 0),
                child: SizedBox(
                  height: 8.h,
                  child: TextField(
                    controller: holderController,
                    onChanged: (text) {
                      setState(() {
                        holder = holderController.text;
                      });
                    },
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
                        labelText: 'Card Holder Name',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(4.h, 2.h, 4.h, 0),
                child: SizedBox(
                  height: 8.h,
                  child: TextField(
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    //maxLength: 3,
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
                        labelText: 'CVV',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 4.h, 0, 0),
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
                      onPressed: () => sl<PaymentCubit>().addCard(
                          numberController.text,
                          dateController.text,
                          holderController.text,
                          cvvController.text),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          'Save',
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
    );
  }

  void handleReadOnlyInputClick(context) {
    showBottomSheet(
      context: context,
      builder: (_) => Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: YearPicker(
            selectedDate: DateTime(1997),
            firstDate: DateTime(1995),
            lastDate: DateTime.now(),
            onChanged: (val) {
              print(val);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
