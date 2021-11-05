import 'dart:math';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double _width = 0;
  double _height = 0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
                child: ClayContainer(
                  color: Colors.white,
                  spread: 5,
                  depth: 10,
                  borderRadius: 20,
                  height: 9.h,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 10.h),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            // Define how long the animation should take.
            duration: const Duration(seconds: 1),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
            height: _height,
            width: _width,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              // Use setState to rebuild the widget with new values.
              setState(() {
                // Create a random number generator.
                final random = Random();

                // Generate a random width and height.
                _width = double.infinity;
                _height = 20.h;

                // Generate a random border radius.
                _borderRadius =
                    BorderRadius.circular(random.nextInt(100).toDouble());
              });
            },
            child: Text('Test'))
      ],
    );
  }
}
