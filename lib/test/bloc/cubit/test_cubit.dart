

import 'package:bloc/bloc.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';

import 'test_cubit_state.dart';

class TestCubit extends Cubit<TestCubitState>{
  TestCubit():super(TestCubitState());

  void increment(){
    loggerSingle("执行了...increment()");
    state.count++;
    emit(state.clone());
    // emit(state);

  }

}