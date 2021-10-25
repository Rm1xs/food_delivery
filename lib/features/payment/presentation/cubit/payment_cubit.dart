import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/payment/data/models/card_model.dart';
import 'package:food_delivery/features/payment/domain/usecases/payment_usecase_implementation.dart';

class PaymentCubit extends Cubit<CardModel> {
  PaymentCubit(this._authenticationRepository)
      : super(CardModel('', '', '', ''));

  final PaymentUseCaseImplementation _authenticationRepository;

  void addCard(
      String number, String dateTime, String holder, String cvv) async {
    await _authenticationRepository.repository
        .saveCardInfo(number, dateTime, holder, cvv);
    emit(state);
  }

  Future<bool> checkCard() async {
    bool cardExist = await _authenticationRepository.repository.checkCard();
    return cardExist;
  }
}
