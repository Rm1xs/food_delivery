import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/validation/email.dart';
import 'package:food_delivery/core/validation/password.dart';
import 'package:food_delivery/features/auth/domain/usecases/auth_usecase_implementation.dart';
import 'package:food_delivery/features/auth/presentation/screen/signup/cubit/sign_up_state.dart';
import 'package:formz/formz.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthUseCaseImplementation _authenticationRepository;

  void emailChanged(String value) {
    final Email email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final Password password = Password.dirty(value);
    final ConfirmedPassword confirmedPassword = ConfirmedPassword.dirty(
      //password: password.value,
      state.confirmedPassword.value,
    );
    emit(state.copyWith(
      password: password,
      confirmedPassword: confirmedPassword,
      status: Formz.validate([
        state.email,
        password,
        confirmedPassword,
      ]),
    ));
  }

  void confirmedPasswordChanged(String value) {
    final ConfirmedPassword confirmedPassword = ConfirmedPassword.dirty(
      value,
    );
    emit(state.copyWith(
      confirmedPassword: confirmedPassword,
      status: Formz.validate([
        state.email,
        state.password,
        confirmedPassword,
      ]),
    ));
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.signUp(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
