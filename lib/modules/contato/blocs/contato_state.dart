import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/contato_model.dart';

@immutable
abstract class ContatoState extends Equatable {}

class ContatoLoadingState extends ContatoState {
  @override
  List<Object?> get props => [];
}

class ContatoLoadedState extends ContatoState {
  ContatoLoadedState(this.contatos);
  final List<ContatoModel>? contatos;
  @override
  List<Object?> get props => [contatos];
}

class ContatoErrorState extends ContatoState {
  ContatoErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
