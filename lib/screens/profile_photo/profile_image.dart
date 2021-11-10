import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/profile/domain/usecases/profile_usecase_implementation.dart';
import 'package:food_delivery/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:food_delivery/screens/profile_photo/profile_image_page.dart';

import '../../injection.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider<ProfileCubit>(
          create: (_) => ProfileCubit(sl<ProfileUseCaseImplementation>()),
          child: ProfileImagePage(
            camera: camera,
          ),
        ),
      ),
    );
  }
}
