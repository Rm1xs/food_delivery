import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/profile/domain/usecases/profile_usecase_implementation.dart';
import 'package:food_delivery/features/profile/presentation/cubit/profile_cubit.dart';

import '../../../../injection.dart';
import 'general_info_content.dart';

class GeneralInfoMainPage extends StatelessWidget {
  const GeneralInfoMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_) => ProfileCubit(sl<ProfileUseCaseImplementation>()),
      child: const GeneralInfoContent(),
    );
  }
}
