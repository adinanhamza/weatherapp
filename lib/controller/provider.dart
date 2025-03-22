import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:weatherapp/model/model.dart';
import 'package:weatherapp/service/service.dart';

class weatherprovider extends ChangeNotifier{

ApiService apiService = ApiService();
List <weathermodel> weatherdata = [];
bool isloading = false;

 Future <void> getweatherdata(String place)async{
  isloading = true;
    notifyListeners();
    try {
      weathermodel data = await apiService.fetchdata(place);
      weatherdata = [data];
log('provider data : $weatherdata');
    } catch (e) {
      // throw Exception( 'erre on pro function $e');
      log('error provider $e');
    }finally{
      isloading = false;
      notifyListeners();
    }
 }
}