import 'package:flutter/material.dart';
import 'package:new_app_drift/app/library.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(serviceLocator<AppSharedPreferences>().getCounter());

  void increment() {
    var cnt = state + 1;
    serviceLocator<AppSharedPreferences>().setCounter(cnt);
    emit(cnt);
  }

  void decrement() {
    var cnt = state - 1;
    serviceLocator<AppSharedPreferences>().setCounter(cnt);
    emit(cnt);
  }

  void setCounter(int counter) {
    emit(serviceLocator<AppSharedPreferences>().getCounter());
  }
}

extension CounterCubitX on BuildContext {
  CounterCubit get counter => serviceLocator<CounterCubit>();
}
