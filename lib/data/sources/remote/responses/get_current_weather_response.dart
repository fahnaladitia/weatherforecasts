class GetCurrentWeatherResponse {
  GetCurrentWeatherResponseCoord? coord;
  List<GetCurrentWeatherResponseWeather>? weather;
  String? base;
  GetCurrentWeatherResponseMain? main;
  num? visibility;
  GetCurrentWeatherResponseWind? wind;
  GetCurrentWeatherResponseClouds? clouds;
  num? dt;
  GetCurrentWeatherResponseSys? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;

  GetCurrentWeatherResponse(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  GetCurrentWeatherResponse.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? GetCurrentWeatherResponseCoord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <GetCurrentWeatherResponseWeather>[];
      json['weather'].forEach((v) {
        weather!.add(GetCurrentWeatherResponseWeather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? GetCurrentWeatherResponseMain.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? GetCurrentWeatherResponseWind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? GetCurrentWeatherResponseClouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? GetCurrentWeatherResponseSys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}

class GetCurrentWeatherResponseCoord {
  num? lon;
  num? lat;

  GetCurrentWeatherResponseCoord({this.lon, this.lat});

  GetCurrentWeatherResponseCoord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class GetCurrentWeatherResponseWeather {
  num? id;
  String? main;
  String? description;
  String? icon;

  GetCurrentWeatherResponseWeather({this.id, this.main, this.description, this.icon});

  GetCurrentWeatherResponseWeather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class GetCurrentWeatherResponseMain {
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;
  num? seaLevel;
  num? grndLevel;

  GetCurrentWeatherResponseMain(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});

  GetCurrentWeatherResponseMain.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }
}

class GetCurrentWeatherResponseWind {
  num? speed;
  num? deg;
  num? gust;

  GetCurrentWeatherResponseWind({this.speed, this.deg, this.gust});

  GetCurrentWeatherResponseWind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}

class GetCurrentWeatherResponseClouds {
  num? all;

  GetCurrentWeatherResponseClouds({this.all});

  GetCurrentWeatherResponseClouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class GetCurrentWeatherResponseSys {
  String? country;
  num? sunrise;
  num? sunset;

  GetCurrentWeatherResponseSys({this.country, this.sunrise, this.sunset});

  GetCurrentWeatherResponseSys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}
