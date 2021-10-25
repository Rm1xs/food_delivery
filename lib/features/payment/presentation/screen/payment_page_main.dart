import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/payment/domain/usecases/payment_usecase_implementation.dart';
import 'package:food_delivery/features/payment/presentation/cubit/payment_cubit.dart';
import '../../../../injection.dart';
import 'add_payment_page.dart';

class PaymentPageMain extends StatelessWidget {
  const PaymentPageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (_) => PaymentCubit(sl<PaymentUseCaseImplementation>()),
      child: AddPaymentPage(),
    );
  }
}