import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';

import '../../injection.dart';

class CompleteRegistration extends StatelessWidget {
  CompleteRegistration({Key? key}) : super(key: key);
  final user = sl<AuthenticationBloc>().state.user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(user.email.toString()),
      ),
    );
  }
}
