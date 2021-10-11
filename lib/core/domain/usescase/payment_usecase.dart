abstract class PaymentUseCase {
  Future<void> validateCard();

  Future<void> saveCardInfo();
}
