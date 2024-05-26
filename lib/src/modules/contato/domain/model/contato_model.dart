import 'package:equatable/equatable.dart';

class ContatoModel extends Equatable {
  const ContatoModel({
    required this.id,
    required this.name,
  });
  final String name;
  final int id;

  @override
  List<Object> get props => [name, id];

  Map<dynamic, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  static ContatoModel? fromMap(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return ContatoModel(
      name: map['name'].toString(),
      id: int.tryParse(map['id'].toString()) ?? 0,
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
