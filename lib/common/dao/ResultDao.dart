import 'dart:async';
class DataResult{
  var data;
  bool result;
  int code;
  Future next;

  DataResult(this.data, this.result, this.code, {this.next});
}