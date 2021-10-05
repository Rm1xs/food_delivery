import 'package:food_delivery/core/domain/usescase/usecase.dart';
import 'package:food_delivery/features/auth/data/models/user.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class AuthUseCaseImplementation extends UseCase {
  AuthUseCaseImplementation(this.repository);

  final AuthRepository repository;

  @override
  User get currentUser {
    return repository.currentUser;
  }

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    return await repository.logInWithEmailAndPassword(email, password);
  }

  @override
  Future<void> logInWithGoogle() async {
    return await repository.logInWithGoogle();
  }

  @override
  Future<void> logOut() async {
    return await repository.logOut();
  }

  @override
  Future<void> signUp(String email, String password) async {
    return await repository.signUp(email, password);
  }

  @override
  Stream<User> user() {
    return repository.user();
  }
}
