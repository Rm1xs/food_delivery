import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/profile/data/models/delivery_profile.dart';
import 'package:food_delivery/features/profile/domain/usecases/profile_usecase_implementation.dart';

class ProfileCubit extends Cubit {
  ProfileCubit(this._authenticationRepository) : super(null);
  final ProfileUseCaseImplementation _authenticationRepository;

  Future<DocumentSnapshot<Map<String, dynamic>>> checkProfile() async {
    return await _authenticationRepository.checkDeliveryProfile();
  }

  void createProfile() async {
    await _authenticationRepository.crateDeliveryProfile();
  }
}
