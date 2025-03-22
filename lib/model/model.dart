class weathermodel{
Main? main;
Coord? coord;
Sys? sys;
Wind? wind;

weathermodel({required this.coord,required this.main,required this.sys,required this.wind});

factory  weathermodel.fromjson(Map<String,dynamic>json){
return  weathermodel(
  coord: json["coord"] ?? 'no coord found',
  main: json["main"] ?? 'no main found',
  sys: json["sys"] ?? 'no sys found',
  wind: json["wind"] ?? 'no wind found',
);
}
}

class Main{
double temp;
int pressure;
int sealevel;
int groundlevel;
int humidity;
int timezone;
int visibility;
String name;
Main({required this.temp,required this.humidity,required this.groundlevel,required this.pressure,required this.sealevel,required this.name,required this.timezone,required this.visibility});

factory Main.fromjson(Map<String,dynamic>json){
  return Main(
    temp: json["temp"]?? 'no temp found',
pressure: json["pressure"] ?? 'no presssure found',
sealevel: json["sea_level"] ?? 'no sealevel found',
groundlevel: json["grnd_level"] ?? 'no groundlevel found',
humidity: json["humidity"] ?? 'no humidity found',
name: json["name"] ?? 'no name found',
   timezone: json["timezone"] ?? 'no time found',
   visibility: json["visibility"] ?? 'no time found',

  );
}
}

class Coord{
  double? long;
  double? lati;

  Coord({required this.long,required this.lati});

  factory Coord.fromjson(Map <String,dynamic>json){
    return Coord(lati: json["lon"] ?? 'no longitude found',
    long: json["lat"] ?? 'no latitude found'
    );
  }
}

class Wind{
  double? speed;
  int? dug;

  Wind({required this.speed,required this.dug});

  factory Wind.fromjson(Map<String ,dynamic>json){
return Wind(speed: json["speed"] ?? 'no speed found',
dug: json["deg"] ?? 'no dug found',
);

  }
}

class Sys{
  String? country;
int? sunrise;
int? sunset;

Sys({required this.country,required this.sunrise,required this.sunset});

factory Sys.fromjson(Map<String ,dynamic>json){
  return Sys(
    country: json["country"] ?? 'no country found',
sunrise: json["sunrise"] ?? 'no sunrise found',
sunset: json["sunset"] ?? 'no sunset found'
  
  );
}
}


