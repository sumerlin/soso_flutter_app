
//refresh 维护属性自己widget 刷新的数据模型， 对外给他赋值
class PagingData<T> {

  int? current;
  bool? hitCount;
  int? pages;
  List<T>? data; //关心这个
  bool? searchCount;
  int? size;
  int? total; //关心这个. 服务器给的，判断总数据条数， 根据这个 和 列表数据总量对比，就可以知道是否需要加载更多了

  PagingData();
}