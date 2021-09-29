import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery/ui/auth/signup/signup.dart';
import 'package:food_delivery/ui/onboarding/onboarding_entery_1.dart';
import 'package:food_delivery/ui/onboarding/onboarding_entery_2.dart';
import 'package:food_delivery/ui/onboarding/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    '/OnBoard1': (BuildContext context) => const OnboardingEntery1(),
    '/OnBoard2': (BuildContext context) => const OnboardingEntery2(),
    '/SignUp': (BuildContext context) => const SignUp(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodNinja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
        child: Scaffold(
          body: SplashScreen(nextRoute: '/OnBoard1'),
        ),
      ),
      routes: routes,
    );
  }
}

class SplashScreen extends StatefulWidget {
  final String nextRoute;

  const SplashScreen({Key? key, required this.nextRoute}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Onboarding();
  }
}
