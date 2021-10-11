import 'package:clay_containers/widgets/clay_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_events.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../injection.dart';

//
// class CreditCardPage extends StatefulWidget {
//   const CreditCardPage({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return CreditCardPageState();
//   }
// }
//
// class CreditCardPageState extends State<CreditCardPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.only(
//               right: 10.0, top: 10.0, bottom: 10.0, left: 10),
//           child: Container(
//             width: 40,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               color: const Color.fromRGBO(249, 168, 77, 1)
//                   .withOpacity(0.2), //Colors.white.withOpacity(0.5),
//             ),
//             child: IconButton(
//                 padding: EdgeInsets.zero,
//                 icon: const Icon(
//                   Icons.arrow_back,
//                 ),
//                 color: const Color.fromRGBO(218, 99, 23, 1),
//                 onPressed: () => {Navigator.of(context).pop()}
//                 // sl<AuthenticationBloc>().add(AppLogoutRequested()),
//                 ),
//           ),
//         ),
//         centerTitle: true,
//         title: Column(
//           children: [
//             Text(
//               _auth.currentUser!.email ?? 'Unknown error, try re-login',
//               style: TextStyle(color: Colors.black, fontSize: 12.sp),
//             ),
//             Text(
//               _auth.currentUser?.displayName ?? 'Set phone number',
//               style: TextStyle(
//                   fontSize: 8.sp, color: const Color.fromRGBO(249, 168, 77, 1)),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(
//                 right: 20.0, top: 10.0, bottom: 10.0, left: 10),
//             child: Container(
//               width: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 color: const Color.fromRGBO(249, 168, 77, 1)
//                     .withOpacity(0.2), //Colors.white.withOpacity(0.5),
//               ),
//               child: IconButton(
//                   padding: EdgeInsets.zero,
//                   icon: const Icon(
//                     Icons.logout,
//                   ),
//                   color: const Color.fromRGBO(218, 99, 23, 1),
//                   onPressed: () => {
//                         sl<AuthenticationBloc>().add(
//                           AppLogoutRequested(),
//                         ),
//                       }
//                   // sl<AuthenticationBloc>().add(AppLogoutRequested()),
//                   ),
//             ),
//           ),
//         ],
//       ),
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             CreditCardWidget(
//               cardBgColor: Colors.red,
//               cardNumber: cardNumber,
//               expiryDate: expiryDate,
//               cardHolderName: cardHolderName,
//               cvvCode: cvvCode,
//               showBackView: isCvvFocused,
//               obscureCardNumber: true,
//               obscureCardCvv: true,
//               onCreditCardWidgetChange: (CreditCardBrand) {},
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     CreditCardForm(
//                       formKey: formKey,
//                       onCreditCardModelChange: onCreditCardModelChange,
//                       obscureCvv: true,
//                       obscureNumber: true,
//                       cardNumberDecoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Number',
//                         hintText: 'XXXX XXXX XXXX XXXX',
//                       ),
//                       expiryDateDecoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Expired Date',
//                         hintText: 'XX/XX',
//                       ),
//                       cvvCodeDecoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'CVV',
//                         hintText: 'XXX',
//                       ),
//                       cardHolderDecoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Card Holder Name',
//                       ),
//                       cvvCode: '',
//                       themeColor: Colors.black,
//                       cardNumber: '',
//                       expiryDate: '',
//                       cardHolderName: '',
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     RaisedButton(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Container(
//                         margin: const EdgeInsets.all(8),
//                         child: const Text(
//                           'Validate',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       color: const Color(0xff1b447b),
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           print('valid!');
//                         } else {
//                           print('invalid!');
//                         }
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void onCreditCardModelChange(CreditCardModel creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//     });
//   }
// }

class AddPaymentPage extends StatelessWidget {
  AddPaymentPage({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
        body: SizedBox(
          height: 40.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.h, 5.h, 5.h, 12.h),
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
                        alignment: Alignment.topRight, child: Image.asset('assets/images/mastercard.png', height: 5.h, width: 5.h,)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.h, 1.h, 2.h, 0),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '8630 4816 3940 1742',
                        style: GoogleFonts.inconsolata(
                          textStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.h, 3.h, 2.h, 0),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'CARDHOLDER NAME',
                            style: GoogleFonts.inconsolata(
                              textStyle: TextStyle(
                                  fontSize: 8.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text('VALID THRU',style: GoogleFonts.inconsolata(
                          textStyle: TextStyle(
                              fontSize: 8.sp,
                              color: Colors.white),
                        ), )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
