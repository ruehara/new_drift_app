import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:new_app_drift/src/database/tables/users.drift.dart';

@immutable
abstract class ContatoState extends Equatable {}

class ContatoLoadingState extends ContatoState {
  @override
  List<Object?> get props => [];
}

class ContatoAddState extends ContatoState {
  @override
  List<Object?> get props => [];
}

class ContatoLoadedState extends ContatoState {
  ContatoLoadedState(this.contatos);
  final List<User>? contatos;
  @override
  List<Object?> get props => [contatos];
}

class ContatoErrorState extends ContatoState {
  ContatoErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
