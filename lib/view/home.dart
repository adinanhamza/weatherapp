import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
     body: SingleChildScrollView(
      child: Column(
        children: [

        ],
      ),
     ),
    ));
  }

Widget mainweather(){
return Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
Text('location',style: TextStyle(
  fontSize: 30
),),
  ],
);

}


}