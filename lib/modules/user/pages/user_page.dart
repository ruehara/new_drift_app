import 'package:flutter/material.dart';
import 'package:new_app_drift/app/library.dart';

import '../blocs/user_bloc.dart';
import '../blocs/user_events.dart';
import '../blocs/user_states.dart';
import '../model/user_model.dart';
import '../repository/user_repository.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) => UserBloc(
          RepositoryProvider.of<UserRepository>(context),
        )..add(LoadUserEvent()),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(context.l10n.list_title),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoadedState) {
                List<UserModel> userList = state.users;
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        mouseCursor: SystemMouseCursors.click,
                        onTap: () => context.pushNamed('userdetail',
                            extra: userList[index]),
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        title: Text(
                            '${userList[index].firstname} ${userList[index].lastname}'),
                        subtitle: Text(userList[index].email),
                        leading: Hero(
                          tag: userList[index].avatar,
                          child: CircleAvatar(
                            key: Key(userList[index].avatar),
                            backgroundImage: NetworkImage(
                              userList[index].avatar,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('Error Loading List'));
              }
            },
          ),
        ),
      ),
    );
  }
}
