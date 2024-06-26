import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_drift/src/modules/user/presenter/blocs/user_events.dart';
import 'package:new_app_drift/src/modules/user/presenter/blocs/user_states.dart';
import 'package:new_app_drift/src/modules/user/data/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
