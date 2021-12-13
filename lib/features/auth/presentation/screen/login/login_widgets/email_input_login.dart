import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/cubit/login_cubit.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/cubit/login_state.dart';

class EmailInputLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (LoginState previous, LoginState current) =>
          previous.email != current.email,
      builder: (BuildContext context, LoginState state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (String email) =>
              context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              errorText: state.email.invalid ? '' : null,
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              border: const OutlineInputBorder(),
              labelText: 'Email',
              hintStyle: TextStyle(color: Colors.grey[400]),
              fillColor: Colors.white,
              filled: true),
        );
      },
    );
  }
}
