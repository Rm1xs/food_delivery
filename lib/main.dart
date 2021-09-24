import 'package:flutter/material.dart';
import 'package:food_delivery/ui/onboarding/onboarding_entery_1.dart';
import 'package:food_delivery/ui/onboarding/onboarding_entery_2.dart';
import 'package:food_delivery/ui/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodNinja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SafeArea(
        left: false,
        right: false,
        child: Scaffold(
          body: OnboardingEntery1(),
        ),
      ),
    );
  }
}
