
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/SplashPage.dart';


void main(){
  runApp(
      new MaterialApp(title: "学慧网",theme: new ThemeData(
    primaryIconTheme: const IconThemeData(color: Colors.white),
    brightness: Brightness.light,
    primaryColor: new Color.fromARGB(255, 0, 215, 198),
    accentColor: Colors.cyan[300],
  ),home: new SplashPage()));
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

}
