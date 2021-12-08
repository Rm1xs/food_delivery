import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/delivery/presentation/payment/payment_delivery_content.dart';
import 'package:food_delivery/features/payment/domain/usecases/payment_usecase_implementation.dart';
import 'package:food_delivery/features/payment/presentation/cubit/payment_cubit.dart';

import '../../../../injection.dart';

class PaymentDeliveryMainPage extends StatelessWidget {
  const PaymentDeliveryMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (_) => PaymentCubit(sl<PaymentUseCaseImplementation>()),
      child: PaymentDeliveryContent(),
    );
  }
}
