import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/data/models/user.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AuthenticationEvent {}

class AppUserChanged extends AuthenticationEvent {
  @visibleForTesting
  const AppUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
