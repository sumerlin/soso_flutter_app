import 'package:flutter/material.dart';
import 'package:flutter_app/test/base/base_test_page.dart';
import 'package:flutter_app/test/bloc/bloc/test_bloc.dart';
import 'package:flutter_app/test/bloc/cubit/test_cubit.dart';
import 'package:flutter_app/test/bloc/cubit/test_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/test_event.dart';
import 'bloc/test_state.dart';

class TestBlocPage extends BaseTestPage {
  const TestBlocPage({super.key});

  @override
  String buildTitle() {
    return "TestBlocPage";
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Text("cubit模式："),
        BlocProvider(
          create: (context) => TestCubit(),
          child: Builder(
            builder: (ctx) {
              return Center(
                child: Column(
                  children: [
                    BlocBuilder<TestCubit, TestCubitState>(
                      builder: (context, state) {
                        return Text("count:" + state.count.toString());
                      },
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    FloatingActionButton(
                      child: Text("点击"),
                      onPressed: () {
                        ctx.read<TestCubit>().increment();
                      },
                    ),
                  ],
                ),
              );
            }
          ),
        ),
        Padding(padding: EdgeInsets.all(50)),
        Text("bloc模式："),
        BlocProvider(
          create: (context) => TestBloc(),
          child: Center(
            child: Column(
              children: [
                BlocBuilder<TestBloc, TestState>(
                  builder: (context, state) {
                    return Text("count:" + state.count.toString());
                  },
                ),
                Padding(padding: EdgeInsets.all(10)),
                FloatingActionButton(
                  child: Text("点击"),
                  onPressed: () {
                    BlocProvider.of<TestBloc>(context)..add(AddTestEvent());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
