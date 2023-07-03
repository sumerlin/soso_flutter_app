import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/test/base/base_test_page.dart';

class TestRenderObjectPage extends BaseTestPage{
  const TestRenderObjectPage({super.key});

  @override
  String buildTitle() {
    return "TestRenderObjectPage";
  }


  @override
  Widget buildBody(BuildContext context) {
    return  Center(
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 200,
        color: Colors.lime,
        child: const ShadowRenderObjectWidget(
          offset: 10,
          child: Icon(
            Icons.home,
            size: 100,
          ),
        ),
      ),
    );
  }
}

class ShadowRenderObjectWidget extends SingleChildRenderObjectWidget {
  final double offset;

  const ShadowRenderObjectWidget({super.key, Widget? child, this.offset = 0}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ShadowRenderObject(offset);
  }

  @override
  void updateRenderObject(BuildContext context, covariant ShadowRenderObject renderObject) {
    super.updateRenderObject(context, renderObject);
    //状态更新
    renderObject._offset = offset;
  }
}

//目标是给子child添加 一层阴影
class ShadowRenderObject extends RenderBox with RenderObjectWithChildMixin {
  double _offset;

  ShadowRenderObject(this._offset);

  @override
  void performLayout() {
    // super.performLayout();
    //【1】首先对child进行测量，约束传递,
    //【2】之后设置size大小
    child!.layout(constraints, parentUsesSize: true);
    size = (child as RenderBox).size;
  }



  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    //开始绘画child
    context.paintChild(child!, offset);
    //绘制阴影， 需要添加一层图层
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(child!, offset + Offset(_offset, _offset));
    });
  }
}
