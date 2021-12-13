import 'dart:io';
import 'package:food_delivery/features/auth/data/models/user.dart';

abstract class AuthRepository {
  ///Login
  Future<void> logInWithEmailAndPassword(String email, String password);

  ///Login
  Future<void> logInWithGoogle();

  ///SignUp
  Future<void> signUp(String email, String password);

  ///Get current User
  User get currentUser;

  Future<void> uploadProfileImage(File _imageFile);

  ///Get info of User
  Stream<User> user();

  ///Logout
  Future<void> logOut();
}
