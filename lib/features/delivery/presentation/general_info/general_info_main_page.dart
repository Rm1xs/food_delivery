import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/delivery/domain/usecases/delivery_usecase_implemeentation.dart';
import 'package:food_delivery/features/delivery/presentation/cubit/delivery_cubit.dart';
import 'package:food_delivery/features/profile/domain/usecases/profile_usecase_implementation.dart';
import 'package:food_delivery/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:food_delivery/injection.dart';

import 'general_info_content.dart';


class GeneralInfoMainPage extends StatelessWidget {
  const GeneralInfoMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeliveryCubit>.value(value: DeliveryCubit(sl<DeliveryUseCaseImplementation>())),
        BlocProvider<ProfileCubit>.value(value: ProfileCubit(sl<ProfileUseCaseImplementation>())),
        ],
      child: const GeneralInfoContent(),
    );
  }
}
