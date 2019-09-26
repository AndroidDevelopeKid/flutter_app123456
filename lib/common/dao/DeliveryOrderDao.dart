
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

import 'UserDao.dart';

class DeliveryOrderDao{
  static getLastedDeliveryOrderRecords() async {
    var res;
    res = await HttpManager.netFetch(
        Address.getLastedDeliveryOrderRecords(), null, null, null);
    if(res.code == 403){
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(
          Address.getLastedDeliveryOrderRecords(), null, null, null);
    }
    if (res != null && res.result) {
      print("get lasted delivery order records success : " +  res.data.toString());
      return DataResult(res.data, res.result, res.code);
    }
    if (res != null && !res.result) {
      print("get lasted delivery order records failed : " + res.data.toString());
      return DataResult(res.data, false, res.code);
    }
  }

  static getHistoryBill(dateBegin, dateEnd, skipCount) async {
    var res;
    res = await HttpManager.netFetch(
        Address.getHistoryBill()+ "?StartGenerateDate=${dateBegin}&EndGenerateDate=${dateEnd}&MaxResultCount=${Config.PAGE_SIZE}&SkipCount=${skipCount}", null, null, null);
    if(res.code == 403){
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(
          Address.getHistoryBill()+ "?StartGenerateDate=${dateBegin}&EndGenerateDate=${dateEnd}&MaxResultCount=${Config.PAGE_SIZE}&SkipCount=${skipCount}", null, null, null);
    }
    if (res != null && res.result) {
      print("get history delivery order records success : " +  res.data.toString());
      return DataResult(res.data, true, res.code);
    }else{
      return DataResult(res.data, false, res.code);
    }
  }
}