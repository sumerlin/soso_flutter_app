

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class TestCubitState  {

   int count= 1;

   TestCubitState clone(){
     return TestCubitState()..count = count;
   }

}