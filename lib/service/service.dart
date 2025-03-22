



import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/model/model.dart';


class ApiService {
 
  Dio dio = Dio();


  Future<weathermodel>fetchdata(String place)async{

     String url = 'https://api.openweathermap.org/data/2.5/weather?q=$place&appid=218ebbb372884cecfd15fecc029d35cb&units=metric';
     log('place from api : $place');
    final response = await dio.get(url);
    try {
      if(response.statusCode == 200){
        log('response from api : ${response.toString()}');
    return weathermodel.fromjson(response.data);
    
      }else{
        throw Exception('failed to fetch weather${response.statusCode}');
      }
    } catch (e) {
      throw Exception('unexpected error');
    }

  }
}