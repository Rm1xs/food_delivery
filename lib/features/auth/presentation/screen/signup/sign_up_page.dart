import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/domain/usecases/auth_usecase_implementation.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/login_page.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/sign_up_form.dart';

import '../../../../../injection.dart';
import 'cubit/sign_up_cubit.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SignUpPage());

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocProvider<SignUpCubit>(
            create: (_) => SignUpCubit(sl<AuthUseCaseImplementation>()),
            child: const SignUp(),
          ),
        ),
      ),
    );
  }
}
