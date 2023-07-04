

class TestState{
  late int count = 1;

  TestState clone(){
     return TestState()..count = count;
  }

}