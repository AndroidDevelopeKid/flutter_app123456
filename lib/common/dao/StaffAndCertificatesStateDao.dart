
import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/StaffAndCertificatesState.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

class StaffAndCertificatesStateDao{
  static getStaffAndCertificatesStateInfo(tenantId, userId) async{
    next() async {
      var res;
      if(tenantId != null && userId != null){
        res = await HttpManager.netFetch(Address.getStaffAndCertificatesState() + "?TenantId=${int.parse(tenantId)}&UserId=${userId}", null, null, null);
      }else{
        res = new DataResult("获取人员及证照状态失败", false);
      }
      if(res != null && res.result){
        print("staffAndCertificatesStateInfo: " + res.data.toString());

        LocalStorage.save(Config.STAFF_AND_CERTIFICATES_STATE, json.encode(res.data["result"]));
        print("staffAndCertificatesStateInfo.ls" + json.encode(res.data["result"]));

        return new DataResult(json.encode(res.data["result"]), true);

      }else{
        return new DataResult(res.data, false);
      }
    }
    return await next();
  }
}