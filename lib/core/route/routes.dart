import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/login_page.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_form.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_page.dart';
import 'package:food_delivery/screens/congrats/sign_up_success.dart';
import 'package:food_delivery/screens/details/complite_registration.dart';
import 'package:food_delivery/screens/onboarding/onboarding_entery_1.dart';
import 'package:food_delivery/screens/onboarding/onboarding_entery_2.dart';
import 'package:food_delivery/screens/onboarding/onboarding_screen.dart';
import 'package:food_delivery/screens/test_profile.dart';

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
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/SignUpSuccess':
        return MaterialPageRoute(builder: (_) => const SignUpSuccess());
      case '/HomePage':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/CompliteRegistration':
        return MaterialPageRoute(builder: (_) => CompliteRegistration());
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
