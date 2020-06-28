import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/HomePage.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,

    systemNavigationBarColor: Colors.transparent, // navigation bar color
    systemNavigationBarIconBrightness: Brightness.dark
  ));

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          unselectedWidgetColor: Colors.white,
        ),
        home: HomePage(),        //color: Color.fromRGBO(37, 152, 74, 1.0),
      )
  );
}
