import 'dart:async';
class DataResult{
  var data;
  bool result;
  int code;
  Future next;
  int total;

  DataResult(this.data, this.result, this.code, {this.next, this.total});
}