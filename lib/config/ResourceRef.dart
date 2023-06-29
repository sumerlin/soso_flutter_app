


typedef R = ResourceRef;

/// 资源名管理器
/// 图片
class ResourceRef {
  ResourceRef._();

  static final Img = Imgs.instance;
  // static final Str = Strs.instance;
  // static final Jsp = JsonPath.instance;
}

class Imgs {
  Imgs._();
  static final instance = Imgs._();

  ///gif
  final ic_playing = 'resource/image/ic_playing.gif';

}