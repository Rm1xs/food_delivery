import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/injection.dart';
import 'package:sizer/sizer.dart';
import 'core/route/routes_path.dart';
import 'features/auth/domain/usecases/auth_usecase_implementation.dart';
import 'features/auth/presentation/bloc/authentication_bloc.dart';
import 'features/auth/presentation/bloc/authentication_state.dart';
import 'features/auth/presentation/routes/auth_route.dart';
import 'injection.dart' as di;
import 'package:food_delivery/core/route/routes.dart' as customRoutes;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = sl<AuthUseCaseImplementation>();
    return Sizer(builder: (context, orientation, deviceType) {
      return RepositoryProvider.value(
        value: data,
        child: BlocProvider(
          create: (_) => AuthenticationBloc(
            authenticationRepository: data,
          ),
          child: const AppView(),
        ),
      );
    });
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // onGenerateRoute: customRoutes.Router.generateRoute,
      // initialRoute: onboardingRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlowBuilder<AuthenticationStatus>(
        state: context.select((AuthenticationBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
