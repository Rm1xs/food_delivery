import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/bloc/bloc.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/login_page.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_page.dart';
import 'package:food_delivery/screens/test_profile.dart';

List<Page> onGenerateAppViewPages(
    AuthenticationStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthenticationStatus.authenticated:
      return [HomePage.page()];
    case AuthenticationStatus.unauthenticated:
      return [LoginPage.page(), SignUpPage.page()];
    default:
      return [SignUpPage.page()];
  }
}
