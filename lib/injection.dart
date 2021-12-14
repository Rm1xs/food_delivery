import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_delivery/features/auth/domain/usecases/auth_usecase_implementation.dart';
import 'package:food_delivery/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:food_delivery/features/delivery/domain/repositories/delivery_repository.dart';
import 'package:food_delivery/features/delivery/domain/usecases/delivery_usecase_implemeentation.dart';
import 'package:food_delivery/features/delivery/presentation/cubit/delivery_cubit.dart';
import 'package:food_delivery/features/notification/data/repository/notification_repository_implementation.dart';
import 'package:food_delivery/features/notification/domain/repositories/notification_repository.dart';
import 'package:get_it/get_it.dart';
import 'features/auth/data/repositories/auth_repository_implementation.dart';
import 'features/auth/presentation/screen/login/cubit/login_cubit.dart';
import 'features/auth/presentation/screen/signup/cubit/sign_up_cubit.dart';
import 'features/delivery/data/repositories/delivery_repository_implementation.dart';
import 'features/food/data/repositories/food_repository_implementation.dart';
import 'features/food/domain/repositories/food_repository.dart';
import 'features/food/domain/usecases/food_usecase_implementation.dart';
import 'features/food/presentation/cubit/food_cubit.dart';
import 'features/notification/domain/usecases/notification_usecase_implementation.dart';
import 'features/notification/presentation/cubit/notification_cubit.dart';
import 'features/orders/data/repositories/orders_repository_imlementation.dart';
import 'features/orders/domain/repositories/orders_repository.dart';
import 'features/orders/domain/usecases/orders_usecase_implementation.dart';
import 'features/orders/presentation/cubit/orders_cubit.dart';
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
  sl.registerFactory(
    () => FoodCubit(sl()),
  );
  sl.registerFactory(
    () => OrdersCubit(sl()),
  );
  sl.registerFactory(
    () => NotificationCubit(sl()),
  );
  sl.registerFactory(
        () => DeliveryCubit(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => AuthUseCaseImplementation(sl()));
  sl.registerLazySingleton(() => PaymentUseCaseImplementation(sl()));
  sl.registerLazySingleton(() => ProfileUseCaseImplementation(sl()));
  sl.registerLazySingleton(() => FoodUseCaseImplementation(sl()));
  sl.registerLazySingleton(() => OrdersUseCaseImplementation(sl()));
  sl.registerLazySingleton(() => NotificationUseCaseImplementation(sl()));
  sl.registerLazySingleton(() => DeliveryUseCaseImplementation(sl()));

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
  sl.registerLazySingleton<FoodRepository>(
    () => FoodRepositoryImplementation(),
  );
  sl.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImplementation(),
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImplementation(),
  );
  sl.registerLazySingleton<DeliveryRepository>(
        () => DeliveryRepositoryImplementation(),
  );
}
