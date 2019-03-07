package com.my.flutter_app123456;

import android.os.Bundle;


import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {


  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    registerCustomPlugin(this);

  }
  private static void registerCustomPlugin(PluginRegistry registry){
    FlutterPluginReceive.registerWith(registry.registrarFor(FlutterPluginReceive.CHANNEL));
    FlutterPluginRabbitMQ.registerWith(registry.registrarFor(FlutterPluginRabbitMQ.CHANNEL));

  }





}
