import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/profile/domain/usecases/profile_usecase_implementation.dart';

class ProfileCubit extends Cubit {
  ProfileCubit(this._authenticationRepository) : super(null);
  final ProfileUseCaseImplementation _authenticationRepository;

  Future<DocumentSnapshot<Map<String, dynamic>>> checkProfile() async {
    return await _authenticationRepository.checkDeliveryProfile();
  }

  Future<DocumentSnapshot> getProfile() async {
    await _authenticationRepository.checkDeliveryProfile().then(
          (value) => {
            if (!value.exists)
              {
                _authenticationRepository.crateDeliveryProfile(),
              }
          },
        );
    return await _authenticationRepository.getDeliveryProfile();
  }

  void createProfile() async {
    await _authenticationRepository.crateDeliveryProfile();
  }

  void updateProfileImage(File path) async {
    await _authenticationRepository.saveImageProfile(path);
  }
  
  Future<String> getFavourite() async {
    var a = await _authenticationRepository.getDeliveryProfile();
    var res = a.get('favourite');
    return res.toString();
  }
}
