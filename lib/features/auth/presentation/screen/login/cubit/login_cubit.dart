import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/validation/email.dart';
import 'package:food_delivery/core/validation/password.dart';
import 'package:food_delivery/features/auth/domain/usecases/auth_usecase_implementation.dart';
import 'package:food_delivery/features/auth/presentation/screen/login/cubit/login_state.dart';
import 'package:formz/formz.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthUseCaseImplementation _authenticationRepository;

  void emailChanged(String value) {
    final Email email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final Password password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle() async {
    await _authenticationRepository.logInWithGoogle();
  }

  Future<void> uploadProfileImage(File _imageFile) async {
    await _authenticationRepository.uploadProfileImage(_imageFile);
  }
}
