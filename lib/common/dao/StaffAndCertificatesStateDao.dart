
import 'dart:convert';

import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/local/LocalStorage.dart';
import 'package:flutter_app123456/common/model/StaffAndCertificatesState.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

import 'UserDao.dart';

class StaffAndCertificatesStateDao{
  static getStaffAndCertificatesStateInfo(tenantId, userId) async{
    next() async {
      var res;
      res = await HttpManager.netFetch(Address.getStaffAndCertificatesState(), null, null, null);// + "?TenantId=${int.parse(tenantId)}&UserId=${userId}"
      if(res.code == 403){
        await UserDao.refreshToken();
        res = await HttpManager.netFetch(Address.getStaffAndCertificatesState(), null, null, null);
       }
      if(res != null && res.result){
        print("staffAndCertificatesStateInfo: " + res.data.toString());
        if(res.data["result"] != null){
          //LocalStorage.save(Config.STAFF_AND_CERTIFICATES_STATE, json.encode(res.data["result"]));
          print("staffAndCertificatesStateInfo.ls" + json.encode(res.data["result"]));
          return new DataResult(json.encode(res.data["result"]), true, res.code);
        }else{
          return new DataResult(null, true, res.code);
        }

      }else{
        return new DataResult(res.data, false, res.code);
      }
    }
    return await next();
  }
}