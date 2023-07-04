import 'package:bloc/bloc.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';

import 'test_event.dart';
import 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestState()){
    on<AddTestEvent>((event, emit) => addCount(event, emit));
  }

 void addCount(AddTestEvent event, Emitter<TestState> emit) {
    loggerSingle("执行了...addCount()");
    state.count++;
    emit(state.clone());
  }

  @override
  void onEvent(TestEvent event) {
    super.onEvent(event);
    loggerSingle("执行了...onEvent()");
  }

  @override
  void onTransition(Transition<TestEvent, TestState> transition) {
    super.onTransition(transition);
    loggerSingle("执行了...onTransition()");
  }

  @override
  void onChange(Change<TestState> change) {
    super.onChange(change);
    loggerSingle("执行了...onChange()");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    loggerSingle("执行了...onError()");
  }
}
