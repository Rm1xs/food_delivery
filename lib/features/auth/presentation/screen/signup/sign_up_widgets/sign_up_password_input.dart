import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/cubit/sign_up_cubit.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/cubit/sign_up_state.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (SignUpState previous, SignUpState current) =>
          previous.password != current.password,
      builder: (BuildContext context, SignUpState state) {
        return TextField(
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (String password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              errorText: state.password.invalid ? '' : null,
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
              labelText: 'Password',
              hintStyle: TextStyle(color: Colors.grey[400]),
              fillColor: Colors.white,
              filled: true),
        );
      },
    );
  }
}
