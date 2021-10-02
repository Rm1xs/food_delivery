import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/signin.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/signup.dart';
import 'package:food_delivery/screens/onboarding/onboarding_screen.dart';
import 'package:sizer/sizer.dart';

import 'core/util/sizer/size.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'FoodNinja',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SafeArea(
            child: Scaffold(
              body: SignUp(),
            ),
          ),
        );
      },
    );
  }
}
