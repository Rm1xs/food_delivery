import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_delivery/features/profile/data/models/delivery_profile.dart';
import 'package:food_delivery/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  ProfileRepositoryImplementation({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> crateDeliveryProfile() async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final CollectionReference deliveryProfile =
        FirebaseFirestore.instance.collection('Delivery Profiles');

    final String name = tokenResult.displayName ?? 'Unknown';
    final String email = tokenResult.email ?? 'Unknown';

    final DeliveryProfile post = DeliveryProfile(
        name, Subscription.Iron_Profile.toShortString(), 0, email);

    final Map<String, dynamic> postData = post.toJson();
    await deliveryProfile.doc(idToken.toString()).set(postData);
  }

  @override
  Future<void> getMembership() {
    // TODO: implement getMembership
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavourite() {
    // TODO: implement removeFavourite
    throw UnimplementedError();
  }

  @override
  Future<void> saveFavourite() {
    // TODO: implement saveFavourite
    throw UnimplementedError();
  }

  @override
  Future<void> saveImageProfile(File path) async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference ref =
        storage.ref().child('profile_images').child('profile_image_$idToken');
    final UploadTask uploadTask = ref.putFile(path);
    uploadTask.then((TaskSnapshot res) {
      res.ref.getDownloadURL();
    });
  }

  @override
  Future<void> updateImageProfile() {
    // TODO: implement updateImageProfile
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> checkDeliveryProfile() {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;

    final Future<DocumentSnapshot<Map<String, dynamic>>> result =
        FirebaseFirestore.instance
            .collection('Delivery Profiles')
            .doc(idToken)
            .get()
            .then((DocumentSnapshot<Map<String, dynamic>> value) => value);
    return result;
  }

  @override
  Future<DocumentSnapshot> getDeliveryProfile() async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final DocumentSnapshot<Map<String, dynamic>> document =
        await FirebaseFirestore.instance
            .collection('Delivery Profiles')
            .doc(idToken)
            .get();
    return document;
  }

  @override
  Future<String> getImageProfile() async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    var reference = FirebaseStorage.instance
        .ref()
        .child('profile_images/profile_image_$idToken');
    return await reference.getDownloadURL();
  }
}
