import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/provider.dart';
import 'package:weatherapp/view/home.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => weatherprovider(),
      child: MaterialApp(
        home: WeatherApp(),
      ),
    );
  }
}