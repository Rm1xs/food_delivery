import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/auth/data/models/user.dart'
    as customUser;
import 'package:food_delivery/features/auth/data/models/user_hive.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';
import 'package:hive/hive.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final Box _box;
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImplementation({
    FirebaseAuth? firebaseAuth,
    Box? box,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance, _box = box ?? Hive.box<UserHive>('userBox');


  @override
  customUser.User get currentUser {
    customUser.User? value;
    String uid = _firebaseAuth.currentUser!.uid;
    value = _box.get(uid);

    return value ?? customUser.User.empty;
  }

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logInWithGoogle() {
    // TODO: implement logInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } on Exception {
      throw LogOutFailure();
    }
  }

  @override
  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw SignUpFailure();
    }
  }

  @override
  Stream<customUser.User> user() {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? customUser.User.empty : firebaseUser.toUser;
      //_box.put(user.id, user);
      _box.add(user);
      return user;
    });
  }
}

extension on User {
  customUser.User get toUser {
    return customUser.User(
        id: uid, email: email, name: displayName, photo: photoURL);
  }
}


/// Thrown if during the sign up process if a failure occurs.
class SignUpFailure implements Exception {}

/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}
