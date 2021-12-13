import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_delivery/features/auth/data/models/user.dart';
import 'package:food_delivery/features/auth/domain/usecases/auth_usecase_implementation.dart';
import 'package:food_delivery/features/auth/presentation/bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthUseCaseImplementation authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AuthenticationState.authenticated(
                  authenticationRepository.currentUser)
              : const AuthenticationState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user().listen(
          (User user) => add(AppUserChanged(user)),
        );
  }

  final AuthUseCaseImplementation _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AuthenticationState> emit) {
    if (event.user.isNotEmpty &&
        event.user.name != null &&
        event.user.phone != null) {
      emit(AuthenticationState.completeInfo(event.user));
    } else if (event.user.isNotEmpty) {
      emit(AuthenticationState.needInfo(event.user));
    } else if (event.user.isEmpty) {
      emit(const AuthenticationState.unauthenticated());
    } else {
      emit(const AuthenticationState.unauthenticated());
    }
  }

  void _onLogoutRequested(
      AppLogoutRequested event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logOut();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
