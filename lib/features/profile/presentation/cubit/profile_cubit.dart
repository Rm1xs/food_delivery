import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/profile/domain/usecases/profile_usecase_implementation.dart';

class ProfileCubit extends Cubit<void> {
  ProfileCubit(this._authenticationRepository) : super(null);
  final ProfileUseCaseImplementation _authenticationRepository;

  Future<DocumentSnapshot<Map<String, dynamic>>> checkProfile() async {
    return await _authenticationRepository.checkDeliveryProfile();
  }

  Future<DocumentSnapshot> getProfile() async {
    await _authenticationRepository.checkDeliveryProfile().then(
          (DocumentSnapshot<Map<String, dynamic>> value) => {
            if (!value.exists)
              {
                _authenticationRepository.crateDeliveryProfile(),
              }
          },
        );
    return await _authenticationRepository.getDeliveryProfile();
  }

  void createProfile() async =>
      await _authenticationRepository.crateDeliveryProfile();

  void updateProfileImage(File path) async =>
      await _authenticationRepository.saveImageProfile(path);

  Future<String> getFavourite() async {
    final DocumentSnapshot<Object?> fav =
        await _authenticationRepository.getDeliveryProfile();
    final String res = fav.get('favourite');
    return res;
  }

  Future<String> getProofileImage() {
    return _authenticationRepository.getImageProfile();
  }
}
