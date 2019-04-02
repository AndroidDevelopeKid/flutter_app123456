
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app123456/common/config/Config.dart';
import 'package:flutter_app123456/common/dao/ResultDao.dart';
import 'package:flutter_app123456/common/model/Release.dart';
import 'package:flutter_app123456/common/net/Address.dart';
import 'package:flutter_app123456/common/net/HttpApi.dart';
import 'package:flutter_app123456/common/net/HttpApiForGit.dart';
import 'package:flutter_app123456/common/utils/CommonUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

class ReposDao{
  /**
   * 获取仓库的release列表
   */
  static getRepositoryReleaseDao(userName, reposName, page, {needHtml = true, release = true}) async {
    String url = release
        ? Address.getReposRelease(userName, reposName) + Address.getPageParams("?", page)
        : Address.getReposTag(userName, reposName) + Address.getPageParams("?", page);

    var res = await HttpManagerForGit.netFetchForGit(
        url,
        null,
        {"Accept": (needHtml ? 'application/vnd.github.html,application/vnd.github.VERSION.raw' : ""),},
        null
    );
    if (res != null && res.result && res.data.length > 0) {
      List<Release> list = new List();
      var dataList = res.data;
      if (dataList == null || dataList.length == 0) {
        return new DataResult(null, false);
      }
      for (int i = 0; i < dataList.length; i++) {
        var data = dataList[i];
        list.add(Release.fromJson(data));
      }
      return new DataResult(list, true);
    } else {
      return new DataResult(null, false);
    }
  }

  /**
   * 版本更新
   */
  static getNewsVersion(context, showTip) async {
    //ios不检查更新
    if (Platform.isIOS) {
      return;
    }
    var res = await getRepositoryReleaseDao("AndroidDevelopeKid", 'flutter_app123456', 1, needHtml: false);
    if (res != null && res.result && res.data.length > 0) {
      Release release = res.data[0];
      String versionName = release.name;
      if (versionName != null) {
        if (Config.DEBUG) {
          print("versionName " + versionName);
        }

        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        var appVersion = packageInfo.version;

        if (Config.DEBUG) {
          print("appVersion " + appVersion);
        }
        Version versionNameNum = Version.parse(versionName);
        Version currentNum = Version.parse(appVersion);
        int result = versionNameNum.compareTo(currentNum);
        if (Config.DEBUG) {
          print("versionNameNum " + versionNameNum.toString() + " currentNum " + currentNum.toString());
        }
        if (Config.DEBUG) {
          print("newsHad " + result.toString());
        }
        if (result > 0) {
          CommonUtils.showUpdateDialog(context, release.name + ": " + release.body);
        } else {
          if (showTip) Fluttertoast.showToast(msg: "当前不是最新版本");
        }
      }
    }
  }
}