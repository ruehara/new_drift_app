import 'package:flutter/material.dart';
import 'package:new_app_drift/library.dart';
import 'package:new_app_drift/database/tables/users.drift.dart';
import '../blocs/contato_bloc.dart';
import '../blocs/contato_events.dart';
import '../blocs/contato_state.dart';
import '../contato.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContatoRepository(),
      child: BlocProvider(
        create: (context) => ContatoBloc(
          RepositoryProvider.of<ContatoRepository>(context),
        )..add(LoadContatoEvent()),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(context.l10n.list_title),
          ),
          body: BlocBuilder<ContatoBloc, ContatoState>(
            builder: (context, state) {
              if (state is ContatoLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ContatoLoadedState) {
                List<User>? userList = state.contatos; //state.contatos;
                return ListView.builder(
                  itemCount: userList?.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        mouseCursor: SystemMouseCursors.click,
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        title: Text('${userList?[index].name}'),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('Error Loading List'));
              }
            },
          ),
          floatingActionButton: FloatingActionButton.small(
              child: const Icon(Icons.add), onPressed: () {}),
        ),
      ),
    );
  }
}
