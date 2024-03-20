class GetForecastFiveDaysInThreeHourIntervalResponse {
  String? cod;
  num? message;
  num? cnt;
  List<GetForecastFiveDaysInThreeHourIntervalResponseList>? list;
  GetForecastFiveDaysInThreeHourIntervalResponseCity? city;

  GetForecastFiveDaysInThreeHourIntervalResponse({this.cod, this.message, this.cnt, this.list, this.city});

  GetForecastFiveDaysInThreeHourIntervalResponse.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <GetForecastFiveDaysInThreeHourIntervalResponseList>[];
      json['list'].forEach((v) {
        list!.add(GetForecastFiveDaysInThreeHourIntervalResponseList.fromJson(v));
      });
    }
    city = json['city'] != null ? GetForecastFiveDaysInThreeHourIntervalResponseCity.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class GetForecastFiveDaysInThreeHourIntervalResponseList {
  num? dt;
  GetForecastFiveDaysInThreeHourIntervalResponseMain? main;
  List<GetForecastFiveDaysInThreeHourIntervalResponseWeather>? weather;
  GetForecastFiveDaysInThreeHourIntervalResponseClouds? clouds;
  GetForecastFiveDaysInThreeHourIntervalResponseWind? wind;
  num? visibility;
  num? pop;
  GetForecastFiveDaysInThreeHourIntervalResponseRain? rain;
  GetForecastFiveDaysInThreeHourIntervalResponseSys? sys;
  String? dtTxt;

  GetForecastFiveDaysInThreeHourIntervalResponseList(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.rain,
      this.sys,
      this.dtTxt});

  GetForecastFiveDaysInThreeHourIntervalResponseList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? GetForecastFiveDaysInThreeHourIntervalResponseMain.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <GetForecastFiveDaysInThreeHourIntervalResponseWeather>[];
      json['weather'].forEach((v) {
        weather!.add(GetForecastFiveDaysInThreeHourIntervalResponseWeather.fromJson(v));
      });
    }
    clouds =
        json['clouds'] != null ? GetForecastFiveDaysInThreeHourIntervalResponseClouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? GetForecastFiveDaysInThreeHourIntervalResponseWind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    rain = json['rain'] != null ? GetForecastFiveDaysInThreeHourIntervalResponseRain.fromJson(json['rain']) : null;
    sys = json['sys'] != null ? GetForecastFiveDaysInThreeHourIntervalResponseSys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop;
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['dt_txt'] = dtTxt;
    return data;
  }
}

class GetForecastFiveDaysInThreeHourIntervalResponseMain {
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? seaLevel;
  num? grndLevel;
  num? humidity;
  num? tempKf;

  GetForecastFiveDaysInThreeHourIntervalResponseMain(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.seaLevel,
      this.grndLevel,
      this.humidity,
      this.tempKf});

  GetForecastFiveDaysInThreeHourIntervalResponseMain.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempKf;
    return data;
  }
}

class GetForecastFiveDaysInThreeHourIntervalResponseWeather {
  num? id;
  String? main;
  String? description;
  String? icon;

  GetForecastFiveDaysInThreeHourIntervalResponseWeather({this.id, this.main, this.description, this.icon});

  GetForecastFiveDaysInThreeHourIntervalResponseWeather.fromJson(Map<String, dynamic> json) {
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

class GetForecastFiveDaysInThreeHourIntervalResponseClouds {
  num? all;

  GetForecastFiveDaysInThreeHourIntervalResponseClouds({this.all});

  GetForecastFiveDaysInThreeHourIntervalResponseClouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class GetForecastFiveDaysInThreeHourIntervalResponseWind {
  num? speed;
  num? deg;
  num? gust;

  GetForecastFiveDaysInThreeHourIntervalResponseWind({this.speed, this.deg, this.gust});

  GetForecastFiveDaysInThreeHourIntervalResponseWind.fromJson(Map<String, dynamic> json) {
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

class GetForecastFiveDaysInThreeHourIntervalResponseRain {
  num? d3h;

  GetForecastFiveDaysInThreeHourIntervalResponseRain({this.d3h});

  GetForecastFiveDaysInThreeHourIntervalResponseRain.fromJson(Map<String, dynamic> json) {
    d3h = json['3h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = d3h;
    return data;
  }
}

class GetForecastFiveDaysInThreeHourIntervalResponseSys {
  String? pod;

  GetForecastFiveDaysInThreeHourIntervalResponseSys({this.pod});

  GetForecastFiveDaysInThreeHourIntervalResponseSys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pod'] = pod;
    return data;
  }
}

class GetForecastFiveDaysInThreeHourIntervalResponseCity {
  num? id;
  String? name;
  GetForecastFiveDaysInThreeHourIntervalResponseCoord? coord;
  String? country;
  num? population;
  num? timezone;
  num? sunrise;
  num? sunset;

  GetForecastFiveDaysInThreeHourIntervalResponseCity(
      {this.id, this.name, this.coord, this.country, this.population, this.timezone, this.sunrise, this.sunset});

  GetForecastFiveDaysInThreeHourIntervalResponseCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? GetForecastFiveDaysInThreeHourIntervalResponseCoord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class GetForecastFiveDaysInThreeHourIntervalResponseCoord {
  num? lat;
  num? lon;

  GetForecastFiveDaysInThreeHourIntervalResponseCoord({this.lat, this.lon});

  GetForecastFiveDaysInThreeHourIntervalResponseCoord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}
