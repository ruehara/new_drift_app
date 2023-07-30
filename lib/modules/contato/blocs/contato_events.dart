import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class ContatoEvent extends Equatable {
  const ContatoEvent();
}

class LoadContatoEvent extends ContatoEvent {
  @override
  List<Object?> get props => [];
}
