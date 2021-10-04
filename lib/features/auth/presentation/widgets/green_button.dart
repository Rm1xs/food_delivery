import 'package:flutter/material.dart';
import 'package:food_delivery/core/route/routes_path.dart';
import 'package:sizer/sizer.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final String redirectToRoute;

  const GreenButton({
    Key? key,
    required this.text,
    required this.redirectToRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 40.w,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
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
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          if (redirectToRoute == signInRoute) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                signInRoute, (Route<dynamic> route) => false);
          } else {
            Navigator.pushNamed(context, redirectToRoute);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11.sp,
              // fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
