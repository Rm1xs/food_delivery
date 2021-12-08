import 'package:food_delivery/core/domain/usescase/payment_usecase.dart';
import 'package:food_delivery/features/payment/domain/repositories/payment_repository.dart';

class PaymentUseCaseImplementation extends PaymentUseCase {
  final PaymentRepository repository;

  PaymentUseCaseImplementation(this.repository);

  @override
  Future<void> saveCardInfo(
      String number, String dateTime, String holder, String cvv) async {
    return await repository.saveCardInfo(number, dateTime, holder, cvv);
  }

  @override
  Future<void> validateCard() {
    // TODO: implement validateCard
    throw UnimplementedError();
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
