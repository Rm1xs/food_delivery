import 'package:food_delivery/features/auth/data/models/user.dart';
import 'package:equatable/equatable.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  needInfo,
  completeInfo
}

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    required this.status,
    this.user = User.empty,
  });

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.needInfo(User user)
      : this._(status: AuthenticationStatus.needInfo, user: user);

  const AuthenticationState.completeInfo(User user)
      : this._(status: AuthenticationStatus.completeInfo, user: user);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
