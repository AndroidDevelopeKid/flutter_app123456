import 'package:flutter/material.dart';
import 'package:flutter_app123456/widget/Pair.dart';


class BannerItemFactory {

  static List<Widget> banners(List<Pair<String, Color>> param) {

    TextStyle style = new TextStyle(
      fontSize: 70.0,
      color: Colors.white,
    );

    Widget _bannerText(Color color, String text) {

      return new Container(
        alignment: Alignment.center,
        height: double.infinity,
        color: color,
        child: new Text(
          text,
          style: style,
        ),
      );
    }

    Widget _bannerImage(Color color, String url) {

      return new Container(
        alignment: Alignment.center,
        height: double.infinity,
        color: color,
        child: new Image(image: new AssetImage(url), fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
        //new Image.network(url, fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
      );
    }


    List<Widget> _renderBannerItem(List<Pair<String, Color>> param) {

      return param.map((item) {

        final text = item.first;
        final color = item.second;
        return _bannerImage(color, text);
//        return text.startsWith('http://') || text.startsWith('https://') ?
//        _bannerImage(color, text) :
//        _bannerText(color, text);
      }).toList();
    }

    return _renderBannerItem(param);
  }
}