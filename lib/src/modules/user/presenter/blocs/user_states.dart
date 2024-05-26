import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../domain/model/user_model.dart';

@immutable
sealed class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  UserLoadedState(this.users);
  final List<UserModel> users;
  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  UserErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
