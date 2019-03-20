package com.my.flutter_app123456;

import android.content.ContentResolver;
import android.content.Context;
import android.os.Bundle;


import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

//  private static String resourceToUriString(Context context, int resId) {
//    return
//            ContentResolver.SCHEME_ANDROID_RESOURCE
//                    + "://"
//                    + context.getResources().getResourcePackageName(resId)
//                    + "/"
//                    + context.getResources().getResourceTypeName(resId)
//                    + "/"
//                    + context.getResources().getResourceEntryName(resId);
//  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    registerCustomPlugin(this);
//    new MethodChannel(getFlutterView(), "message.io/notice").setMethodCallHandler(
//            new MethodChannel.MethodCallHandler() {
//              @Override
//              public void onMethodCall(MethodCall call, MethodChannel.Result result) {
//                if ("drawableToUri".equals(call.method)) {
//                  int resourceId = MainActivity.this.getResources().getIdentifier((String) call.arguments, "drawable", MainActivity.this.getPackageName());
//                  String uriString = resourceToUriString(MainActivity.this.getApplicationContext(), resourceId);
//                  result.success(uriString);
//                }
//              }
//            });

  }
  private static void registerCustomPlugin(PluginRegistry registry){
    FlutterPluginReceive.registerWith(registry.registrarFor(FlutterPluginReceive.CHANNEL));
    FlutterPluginRabbitMQ.registerWith(registry.registrarFor(FlutterPluginRabbitMQ.CHANNEL));

  }





}
