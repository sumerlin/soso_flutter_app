
enum DramaType {
  ///全部
  all(0, '全部'),

  ///古装剧
  costume(1, '古装剧'),

  ///家庭剧
  family(2, '家庭剧'),

  ///爱情剧
  love(3, '爱情剧'),

  ///悬疑剧
  crux(4, '悬疑剧'),

  ///武侠剧
  kungfu(5, '武侠剧'),

  ///喜剧
  comedy(6, '喜剧'),

  ///战争剧
  war(7, '战争剧');

  final int value;
  final String name;

  const DramaType(this.value, this.name);
}