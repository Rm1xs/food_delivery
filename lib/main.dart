import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/route/routes.dart' as customRoutes;
import 'package:food_delivery/core/route/routes_path.dart';
import 'package:sizer/sizer.dart';
import 'main_features_init.dart';

Future<void> main() async {
  MainFeatureInit.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'FoodNinja',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: customRoutes.Router.generateRoute,
        initialRoute: onboardingRoute,
      );
    });
  }
}
