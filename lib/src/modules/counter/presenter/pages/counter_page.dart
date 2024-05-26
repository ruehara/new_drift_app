import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_app_drift/library.dart';
import 'package:new_app_drift/src/core/theme/_theme.dart';
import 'package:new_app_drift/src/modules/counter/counter.dart';
import 'package:new_app_drift/src/core/utils/exit_dalog.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.counter,
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<AppExitResponse> didRequestAppExit() async {
    AppExitResponse response = AppExitResponse.cancel;
    if (context.mounted) {
      response = await ExitPopupDialog.show(context).then(
          (value) => value ? AppExitResponse.exit : AppExitResponse.cancel);
    }
    if (response == AppExitResponse.cancel) {
      return response;
    } else {
      exit(0);
    }
  }

  Future<bool> exitApp() async {
    if (!context.canPop()) {
      bool ret = await ExitPopupDialog.show(context)
          .then((value) => value ? true : false);
      if (ret) {
        SystemNavigator.pop();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          SystemNavigator.pop();
        }
        exitApp();
      },
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Center(child: Text(l10n.counterAppBarTitle))),
            body: BlocProvider(
              create: (context) => CounterCubit(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      context.l10n.counterInfo,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${context.counter.state}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: const Text('db'),
                  mini: true,
                  onPressed: () => context.push('/contato'),
                  child: const Icon(Icons.data_usage),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: const Text('teste'),
                  mini: true,
                  onPressed: () => context.pushNamed('userlist'),
                  child: const Icon(Icons.arrow_forward),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: Text(l10n.reset),
                  tooltip: l10n.reset,
                  mini: true,
                  onPressed: () =>
                      serviceLocator<AppSharedPreferences>().clearAll(),
                  child: const Icon(Icons.clear),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: Text(l10n.language),
                  tooltip: l10n.language,
                  mini: true,
                  onPressed: () => context.language.updateAppLocale(),
                  child: const Icon(Icons.language),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: Text(l10n.theme),
                  tooltip: l10n.theme,
                  mini: true,
                  onPressed: () => context.theme.updateAppTheme(),
                  child: const Icon(Icons.dark_mode),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: Text(l10n.increment),
                  tooltip: l10n.increment,
                  mini: true,
                  onPressed: () => context.counter.increment(),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: Text(l10n.decrement),
                  tooltip: l10n.decrement,
                  mini: true,
                  onPressed: () => context.counter.decrement(),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
