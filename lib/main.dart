import 'dart:async';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/injection.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sizer/sizer.dart';
import 'core/route/flow_route/routes/auth_route.dart';
import 'features/auth/domain/usecases/auth_usecase_implementation.dart';
import 'features/auth/presentation/bloc/authentication_bloc.dart';
import 'features/auth/presentation/bloc/authentication_state.dart';
import 'injection.dart' as di;
import 'features/notification/service/notification.dart' as notify;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  await di.init();
  await notify.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthUseCaseImplementation data = sl<AuthUseCaseImplementation>();
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
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

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FlowBuilder<AuthenticationStatus>(
          state: context.select((AuthenticationBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
      ),
    );
  }
}
