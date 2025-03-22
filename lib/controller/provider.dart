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

    } catch (e) {
      throw Exception( 'erre$e');
    }finally{
      isloading = false;
      notifyListeners();
    }
 }
}