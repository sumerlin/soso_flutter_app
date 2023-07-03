import 'package:bloc/bloc.dart';

import 'test_event.dart';
import 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestState());


  void addCount(){

  }
}
