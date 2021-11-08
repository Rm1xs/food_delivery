import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_delivery/features/auth/domain/usecases/auth_usecase_implementation.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';
import 'features/auth/data/repositories/auth_repository_implementation.dart';
import 'features/auth/presentation/screen/login/cubit/login_cubit.dart';
import 'features/auth/presentation/screen/signup/cubit/sign_up_cubit.dart';
import 'features/payment/data/repositories/payment_repository_implementation.dart';
import 'features/payment/domain/repositories/payment_repository.dart';
import 'features/payment/domain/usecases/payment_usecase_implementation.dart';
import 'features/payment/presentation/cubit/payment_cubit.dart';
import 'features/profile/data/repositories/profile_repository_implementation.dart';
import 'features/profile/domain/repositories/profile_repository.dart';
import 'features/profile/domain/usecases/profile_usecase_implementation.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => AuthenticationBloc(authenticationRepository: sl()),
  );
  sl.registerFactory(
    () => LoginCubit(sl()),
  );
  sl.registerFactory(
    () => SignUpCubit(sl()),
  );
  sl.registerFactory(
    () => PaymentCubit(sl()),
  );
  sl.registerFactory(
        () => ProfileCubit(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => AuthUseCaseImplementation(sl()));
  sl.registerLazySingleton(() => PaymentUseCaseImplementation(sl()));
  sl.registerLazySingleton(() => ProfileUseCaseImplementation(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplementation(firebaseAuth: FirebaseAuth.instance),
  );
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImplementation(),
  );
  sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImplementation(),
  );
}
