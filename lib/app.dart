import 'package:flutter/material.dart';
import 'package:teen_shop_app/screen/home.dart';
import 'package:teen_shop_app/screen/login.dart';
import 'package:teen_shop_app/screen/productcatalog.dart';
import 'package:teen_shop_app/screen/productslide.dart';
import 'package:teen_shop_app/screen/register.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teen Shop',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Defago',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/login': (_) => Login(),
        '/home': (_) => Home(),
        '/productcatalog': (_) => ProductCatalog(),
        '/productslide': (_) => ProductSlide(),
        '/register' : (_) => Register()
      },
    );
  }
}
