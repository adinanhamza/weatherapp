class weathermodel {
  Main main;
  Coord coord;
  Sys sys;
  Wind wind;

  weathermodel({
    required this.coord,
    required this.main,
    required this.sys,
    required this.wind,
  });

  factory weathermodel.fromjson(Map<String, dynamic> json) {
    return weathermodel(
      coord: Coord.fromjson(json["coord"]),
      main: Main.fromjson(json["main"]),
      sys: Sys.fromjson(json["sys"]),
      wind: Wind.fromjson(json["wind"]),
    );
  }
}

class Main {
  double temp;
  int pressure;
  int sealevel;
  int groundlevel;
  int humidity;
  int timezone;
  int visibility;
  String? name;

  Main({
    required this.temp,
    required this.pressure,
    required this.sealevel,
    required this.groundlevel,
    required this.humidity,
    required this.name,
    required this.timezone,
    required this.visibility,
  });

  factory Main.fromjson(Map<String, dynamic> json) {
    return Main(
      temp: (json["temp"] ?? 0).toDouble(),
      pressure: json["pressure"] ?? 0,
      sealevel: json["sea_level"] ?? 0,
      groundlevel: json["grnd_level"] ?? 0,
      humidity: json["humidity"] ?? 0,
      name: json["name"] ?? 'Unknown',
      timezone: json["timezone"] ?? 0,
      visibility: json["visibility"] ?? 0,
    );
  }
}

class Coord {
  double lati;
  double long;

  Coord({
    required this.lati,
    required this.long,
  });

  factory Coord.fromjson(Map<String, dynamic> json) {
    return Coord(
      lati: (json["lat"] ?? 0).toDouble(),
      long: (json["lon"] ?? 0).toDouble(),
    );
  }
}

class Wind {
  double speed;
  int dug;

  Wind({
    required this.speed,
    required this.dug,
  });

  factory Wind.fromjson(Map<String, dynamic> json) {
    return Wind(
      speed: (json["speed"] ?? 0).toDouble(),
      dug: json["deg"] ?? 0,
    );
  }
}

class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromjson(Map<String, dynamic> json) {
    return Sys(
      country: json["country"] ?? 'Unknown',
      sunrise: json["sunrise"] ?? 0,
      sunset: json["sunset"] ?? 0,
    );
  }
}
