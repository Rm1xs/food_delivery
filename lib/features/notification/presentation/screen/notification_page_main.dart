import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/notification/domain/usecases/notification_usecase_implementation.dart';
import 'package:food_delivery/features/notification/presentation/cubit/notification_cubit.dart';

import '../../../../injection.dart';
import 'notification_page.dart';

class NotificationPageMain extends StatelessWidget {
  const NotificationPageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationCubit>(
      create: (_) => NotificationCubit(sl<NotificationUseCaseImplementation>()),
      child: const NotificationPage(),
    );
  }
}
