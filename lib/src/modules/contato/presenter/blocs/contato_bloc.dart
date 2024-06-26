import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/contato_repository.dart';
import 'contato_events.dart';
import 'contato_state.dart';

class ContatoBloc extends Bloc<ContatoEvent, ContatoState> {
  final ContatoRepository _contatoRepository;

  ContatoBloc(this._contatoRepository) : super(ContatoLoadingState()) {
    on<LoadContatoEvent>((event, emit) async {
      emit(ContatoLoadingState());
      try {
        final contatos = await _contatoRepository.getContatos();
        emit(ContatoLoadedState(contatos));
      } catch (e) {
        emit(ContatoErrorState(e.toString()));
      }
    });
    on<AddContatoEvent>((event, emit) async {
      emit(ContatoAddState());
      try {
        await _contatoRepository.addContato2();
        final contatos = await _contatoRepository.getContatos();
        emit(ContatoLoadedState(contatos));
      } catch (e) {
        emit(ContatoErrorState(e.toString()));
      }
    });
  }
}
