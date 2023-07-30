import 'package:equatable/equatable.dart';

class ContatoModel extends Equatable {
  const ContatoModel({
    required this.id,
    required this.contato,
    required this.nome,
  });
  final String nome;
  final int id;
  final String contato;

  @override
  List<Object> get props => [nome, id, contato];

  Map<dynamic, dynamic> toMap() {
    return {
      'nome': nome,
      'id': id,
      'contato': contato,
    };
  }

  static ContatoModel? fromMap(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return ContatoModel(
      nome: map['nome'].toString(),
      id: int.tryParse(map['id'].toString()) ?? 0,
      contato: map['contato'].toString(),
    );
  }
}

class ContatoViewModel extends Equatable {
  const ContatoViewModel({
    required this.items,
  });

  final List<ContatoModel>? items;

  @override
  List<Object?> get props => [items];

  ContatoViewModel copyWith({
    List<ContatoModel>? items,
  }) {
    return ContatoViewModel(
      items: items ?? this.items,
    );
  }
}
