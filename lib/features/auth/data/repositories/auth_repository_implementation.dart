import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_delivery/features/auth/data/models/user.dart'
    as customUser;
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImplementation implements AuthRepository {
  AuthRepositoryImplementation({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  final FirebaseAuth _firebaseAuth;

  @override
  customUser.User get currentUser {
    //_firebaseAuth.currentUser?.reload();
    if (_firebaseAuth.currentUser == null) {
      return customUser.User.empty;
    } else {
      customUser.User user = customUser.User.empty;
      _firebaseAuth.authStateChanges().map((User? firebaseUser) {
        user =
            firebaseUser == null ? customUser.User.empty : firebaseUser.toUser;
      });
      return user;
    }
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
  Future<void> logInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } on Exception {
      throw LogInWithEmailAndPasswordFailure();
    }
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
    return _firebaseAuth.authStateChanges().map((User? firebaseUser) {
      final customUser.User user =
          firebaseUser == null ? customUser.User.empty : firebaseUser.toUser;
      return user;
    });
  }

  @override
  Future<void> uploadProfileImage(File _imageFile) async {
    final String uid = _firebaseAuth.currentUser!.uid;
    final String fileName = _imageFile.path;
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads-$uid/$fileName');
    final UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    final TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then(
          (String value) => print('Done: $value'),
        );
  }
}

extension on User {
  customUser.User get toUser {
    return customUser.User(
        id: uid,
        email: email,
        name: displayName,
        photo: photoURL,
        phone: phoneNumber);
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
