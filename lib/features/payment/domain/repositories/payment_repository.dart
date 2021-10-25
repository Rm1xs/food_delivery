abstract class PaymentRepository{
  Future<void> validateCard();

  Future<void> saveCardInfo(String number, String dateTime, String holder, String cvv);

  Future<bool> checkCard();
}
