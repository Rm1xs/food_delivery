import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/route/routes.dart' as customRoutes;
import 'package:food_delivery/core/route/routes_path.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
