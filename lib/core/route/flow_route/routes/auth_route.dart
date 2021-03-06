import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/bloc/bloc.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/login_page.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_page.dart';
import 'package:food_delivery/features/food/presentation/screen/food_main_navigation.dart';
import 'package:food_delivery/screens/details/complete_registration_page.dart';

List<Page> onGenerateAppViewPages(
    AuthenticationStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthenticationStatus.authenticated:
      return [FoodMainNavigation.page()];
    case AuthenticationStatus.completeInfo:
      return [FoodMainNavigation.page()];
    case AuthenticationStatus.needInfo:
      return [CompleteRegistration.page()];
    case AuthenticationStatus.unauthenticated:
      return [LoginPage.page(), SignUpPage.page()];
    default:
      return [CompleteRegistration.page()];
  }
}
