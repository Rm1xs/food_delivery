import 'package:food_delivery/features/payment/domain/repositories/payment_repository.dart';

class PaymentUseCaseImplementation {
  PaymentUseCaseImplementation(this.repository);

  final PaymentRepository repository;

  @override
  Future<void> saveCardInfo(
      String number, String dateTime, String holder, String cvv) async {
    return await repository.saveCardInfo(number, dateTime, holder, cvv);
  }

  @override
  Future<bool> checkCard() async {
    return await repository.checkCard();
  }

  @override
  Future<String> getCard() async {
    return await repository.getCard();
  }
}
