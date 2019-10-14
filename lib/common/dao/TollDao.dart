import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';

import 'UserDao.dart';

class TollDao {
  static getTollInquiry(happenDateBegin, happenDateEnd, skipCount) async {
    var res;
    res = await HttpManager.netFetch(
        Address.getTollInquiry() +
            "?HappenDate=${happenDateBegin}&HappenDateTo=${happenDateEnd}&MaxResultCount=${Config.PAGE_SIZE}&SkipCount=${skipCount}",
        null,
        null,
        null);
    if (res.code == Config.ERROR_CODE401 || res.code == Config.ERROR_CODE403) {
      await UserDao.refreshToken();
      res = await HttpManager.netFetch(
          Address.getTollInquiry() +
              "?HappenDate=${happenDateBegin}&HappenDateTo=${happenDateEnd}&MaxResultCount=${Config.PAGE_SIZE}&SkipCount=${skipCount}",
          null,
          null,
          null);
    }
    if (res != null && res.result) {
      print("toll: " + res.data.toString());
      return new DataResult(res.data, true, res.code);
    } else {
      return new DataResult(res.data, false, res.code);
    }
  }
}
