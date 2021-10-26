import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PaymentUseCase {
  Future<void> validateCard();

  Future<void> saveCardInfo(String number, String dateTime, String holder, String cvv);

  Future<bool>  checkCard();
}
