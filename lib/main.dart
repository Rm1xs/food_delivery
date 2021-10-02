import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/onboarding/onboarding_screen.dart';
import 'core/util/route/route_generator.dart';
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
        home: SafeArea(child: Scaffold(body: Onboarding(),)),
      );
    });
  }
}
