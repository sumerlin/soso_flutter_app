import 'package:flutter/material.dart';
import 'package:flutter_app/test/base/base_test_page.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';

class TestAnimationPage extends BaseTestPage {
  const TestAnimationPage({super.key});

  @override
  String buildTitle() {
    return "TestAnimationPage";
  }

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        _TweenAnimation(),
        Padding(padding: EdgeInsets.all(5)),
        _TestAnimatedWidget(),
        Padding(padding: EdgeInsets.all(5)),
        _TestAnimatedScale(),
        Padding(padding: EdgeInsets.all(5)),
        _TestAnimatedPositioned(),
      ]),
    );
  }
}

class _TestAnimatedScale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: SizedBox(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedScale(
                scale: 5,
                duration: Duration(microseconds: 5000),
                child: FlutterLogo(size: 24),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // _controller.reset();
                  // _controller.forward();
                },
                child: Text("tween 动画"))
          ],
        ),
      ),
    );
  }
}

///使用AnimatedWidget
class _TestAnimatedWidget extends StatefulWidget {
  @override
  State<_TestAnimatedWidget> createState() => _TestAnimatedWidgetState();
}

class _TestAnimatedWidgetState extends State<_TestAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _tween;
  late Animation<double> _animate;
  late double animationValue = 0;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _tween = Tween<double>(begin: 1, end: 100);
    _animate = _tween.animate(_controller);
    // _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: SizedBox(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _AnimationWidget(animation: _animate),
            ),
            ElevatedButton(
                onPressed: () {
                  _controller.reset();
                  _controller.forward();
                },
                child: Text("tween 动画"))
          ],
        ),
      ),
    );
  }
}

class _AnimationWidget extends AnimatedWidget {
  const _AnimationWidget({required Animation<double> animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Container(
      height: 50 + animation.value,
      width: 50 + animation.value,
      child: FlutterLogo(),
    );
  }
}

///
class _TweenAnimation extends StatefulWidget {
  @override
  State<_TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<_TweenAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _tween;
  late Animation<double> _animate;
  late double animationValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _tween = Tween<double>(begin: 1, end: 100);
    _animate = _tween.animate(_controller)
      ..addListener(() {
        loggerSingle("animationValue...$animationValue");
        setState(() {
          animationValue = _animate.value;
        });
      })
      ..addStatusListener((status) {
        ///动画状态发生变化时被调用；
        loggerSingle("addStatusListener...$status");
        // if (status == AnimationStatus.completed) {
        //   _controller.reverse();
        // } else if (status == AnimationStatus.dismissed) {
        //   _controller.forward();
        // }
      });

    // _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: SizedBox(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 50 + animationValue,
                width: 50 + animationValue,
                child: FlutterLogo(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _controller.reset();
                    _controller.forward();
                  });
                },
                child: Text("tween 动画"))
          ],
        ),
      ),
    );
  }
}

class _TestAnimatedPositioned extends StatefulWidget {
  @override
  State<_TestAnimatedPositioned> createState() => _TestAnimatedPositionedState();
}

class _TestAnimatedPositionedState extends State<_TestAnimatedPositioned> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    // CustomMultiChildLayout
    // CustomSingleChildLayout
    // SingleChildLayoutDelegate
    // MultiChildLayoutDelegate
    return ColoredBox(
      color: Colors.grey,
      child: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                value = 100;
              });
            },
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: LayoutBuilder(builder: (context, boxConstraints) {
              loggerSingle('boxConstraints...$boxConstraints');
              return Stack(children: [
                AnimatedPositioned(
                  top: 0 + value,
                  left: 0 + value,
                  duration: Duration(seconds: 1),
                  child: FlutterLogo(
                    size: 50,
                  ),
                ),
              ]);
            }),
          ),
        ],
      ),
    );
  }
}
