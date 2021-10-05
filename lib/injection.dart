import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_delivery/features/auth/domain/usecases/auth_usecase_implementation.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/auth/data/repositories/auth_repository_implementation.dart';
import 'features/auth/presentation/screen/login/cubit/login_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
        () => AuthenticationBloc(authenticationRepository: sl()),
  );
  sl.registerFactory(
        () => LoginCubit(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => AuthUseCaseImplementation(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImplementation(),
  );

  // Data sources
  // sl.registerLazySingleton<AuthRepository>(
  //       () => AuthRepositoryImplementation(sl()),
  // );

}

