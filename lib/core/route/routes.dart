import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/sign_in.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up.dart';
import 'package:food_delivery/screens/onboarding/onboarding_entery_1.dart';
import 'package:food_delivery/screens/onboarding/onboarding_entery_2.dart';
import 'package:food_delivery/screens/onboarding/onboarding_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case '/entery1':
        return MaterialPageRoute(builder: (_) => const OnboardingEntery1());
      case '/entery2':
        return MaterialPageRoute(builder: (_) => const OnboardingEntery2());
      case '/signIn':
        return MaterialPageRoute(builder: (_) => const SignIn());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => const SignUp());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
