import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/orders/domain/usecases/orders_usecase_implementation.dart';
import 'package:food_delivery/features/orders/presentation/cubit/orders_cubit.dart';

import '../../../../injection.dart';
import 'order_page.dart';

class OrdersPageMain extends StatelessWidget {
  const OrdersPageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersCubit>(
      create: (_) => OrdersCubit(sl<OrdersUseCaseImplementation>()),
      child: const OrderPage(),
    );
  }
}
