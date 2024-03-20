class GetAutoCompleteGeoapifyResponse {
  List<GetAutoCompleteGeoapifyResponseResults>? results;
  GetAutoCompleteGeoapifyResponseQuery? query;

  GetAutoCompleteGeoapifyResponse({this.results, this.query});

  GetAutoCompleteGeoapifyResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <GetAutoCompleteGeoapifyResponseResults>[];
      json['results'].forEach((v) {
        results!.add(GetAutoCompleteGeoapifyResponseResults.fromJson(v));
      });
    }
    query = json['query'] != null ? GetAutoCompleteGeoapifyResponseQuery.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    if (query != null) {
      data['query'] = query!.toJson();
    }
    return data;
  }
}

class GetAutoCompleteGeoapifyResponseResults {
  String? country;
  String? countryCode;
  String? region;
  String? state;
  String? city;
  GetAutoCompleteGeoapifyResponseDatasource? datasource;
  num? lon;
  num? lat;
  num? population;
  String? resultType;
  String? formatted;
  String? addressLine1;
  String? addressLine2;
  String? category;
  GetAutoCompleteGeoapifyResponseTimezone? timezone;
  String? plusCode;
  String? plusCodeShort;
  GetAutoCompleteGeoapifyResponseRank? rank;
  String? placeId;
  GetAutoCompleteGeoapifyResponseBbox? bbox;

  GetAutoCompleteGeoapifyResponseResults(
      {this.country,
      this.countryCode,
      this.region,
      this.state,
      this.city,
      this.datasource,
      this.lon,
      this.lat,
      this.population,
      this.resultType,
      this.formatted,
      this.addressLine1,
      this.addressLine2,
      this.category,
      this.timezone,
      this.plusCode,
      this.plusCodeShort,
      this.rank,
      this.placeId,
      this.bbox});

  GetAutoCompleteGeoapifyResponseResults.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    countryCode = json['country_code'];
    region = json['region'];
    state = json['state'];
    city = json['city'];
    datasource =
        json['datasource'] != null ? GetAutoCompleteGeoapifyResponseDatasource.fromJson(json['datasource']) : null;
    lon = json['lon'];
    lat = json['lat'];
    population = json['population'];
    resultType = json['result_type'];
    formatted = json['formatted'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    category = json['category'];
    timezone = json['timezone'] != null ? GetAutoCompleteGeoapifyResponseTimezone.fromJson(json['timezone']) : null;
    plusCode = json['plus_code'];
    plusCodeShort = json['plus_code_short'];
    rank = json['rank'] != null ? GetAutoCompleteGeoapifyResponseRank.fromJson(json['rank']) : null;
    placeId = json['place_id'];
    bbox = json['bbox'] != null ? GetAutoCompleteGeoapifyResponseBbox.fromJson(json['bbox']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['country_code'] = countryCode;
    data['region'] = region;
    data['state'] = state;
    data['city'] = city;
    if (datasource != null) {
      data['datasource'] = datasource!.toJson();
    }
    data['lon'] = lon;
    data['lat'] = lat;
    data['population'] = population;
    data['result_type'] = resultType;
    data['formatted'] = formatted;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['category'] = category;
    if (timezone != null) {
      data['timezone'] = timezone!.toJson();
    }
    data['plus_code'] = plusCode;
    data['plus_code_short'] = plusCodeShort;
    if (rank != null) {
      data['rank'] = rank!.toJson();
    }
    data['place_id'] = placeId;
    if (bbox != null) {
      data['bbox'] = bbox!.toJson();
    }
    return data;
  }
}

class GetAutoCompleteGeoapifyResponseDatasource {
  String? sourcename;
  String? attribution;
  String? license;
  String? url;

  GetAutoCompleteGeoapifyResponseDatasource({this.sourcename, this.attribution, this.license, this.url});

  GetAutoCompleteGeoapifyResponseDatasource.fromJson(Map<String, dynamic> json) {
    sourcename = json['sourcename'];
    attribution = json['attribution'];
    license = json['license'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sourcename'] = sourcename;
    data['attribution'] = attribution;
    data['license'] = license;
    data['url'] = url;
    return data;
  }
}

class GetAutoCompleteGeoapifyResponseTimezone {
  String? name;
  String? offsetSTD;
  num? offsetSTDSeconds;
  String? offsetDST;
  num? offsetDSTSeconds;
  String? abbreviationSTD;
  String? abbreviationDST;

  GetAutoCompleteGeoapifyResponseTimezone(
      {this.name,
      this.offsetSTD,
      this.offsetSTDSeconds,
      this.offsetDST,
      this.offsetDSTSeconds,
      this.abbreviationSTD,
      this.abbreviationDST});

  GetAutoCompleteGeoapifyResponseTimezone.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    offsetSTD = json['offset_STD'];
    offsetSTDSeconds = json['offset_STD_seconds'];
    offsetDST = json['offset_DST'];
    offsetDSTSeconds = json['offset_DST_seconds'];
    abbreviationSTD = json['abbreviation_STD'];
    abbreviationDST = json['abbreviation_DST'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['offset_STD'] = offsetSTD;
    data['offset_STD_seconds'] = offsetSTDSeconds;
    data['offset_DST'] = offsetDST;
    data['offset_DST_seconds'] = offsetDSTSeconds;
    data['abbreviation_STD'] = abbreviationSTD;
    data['abbreviation_DST'] = abbreviationDST;
    return data;
  }
}

class GetAutoCompleteGeoapifyResponseRank {
  num? confidence;
  num? confidenceCityLevel;
  String? matchType;

  GetAutoCompleteGeoapifyResponseRank({this.confidence, this.confidenceCityLevel, this.matchType});

  GetAutoCompleteGeoapifyResponseRank.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    confidenceCityLevel = json['confidence_city_level'];
    matchType = json['match_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confidence'] = confidence;
    data['confidence_city_level'] = confidenceCityLevel;
    data['match_type'] = matchType;
    return data;
  }
}

class GetAutoCompleteGeoapifyResponseBbox {
  num? lon1;
  num? lat1;
  num? lon2;
  num? lat2;

  GetAutoCompleteGeoapifyResponseBbox({this.lon1, this.lat1, this.lon2, this.lat2});

  GetAutoCompleteGeoapifyResponseBbox.fromJson(Map<String, dynamic> json) {
    lon1 = json['lon1'];
    lat1 = json['lat1'];
    lon2 = json['lon2'];
    lat2 = json['lat2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon1'] = lon1;
    data['lat1'] = lat1;
    data['lon2'] = lon2;
    data['lat2'] = lat2;
    return data;
  }
}

class GetAutoCompleteGeoapifyResponseQuery {
  String? text;
  GetAutoCompleteGeoapifyResponseParsed? parsed;

  GetAutoCompleteGeoapifyResponseQuery({this.text, this.parsed});

  GetAutoCompleteGeoapifyResponseQuery.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    parsed = json['parsed'] != null ? GetAutoCompleteGeoapifyResponseParsed.fromJson(json['parsed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    if (parsed != null) {
      data['parsed'] = parsed!.toJson();
    }
    return data;
  }
}

class GetAutoCompleteGeoapifyResponseParsed {
  String? city;
  String? expectedType;

  GetAutoCompleteGeoapifyResponseParsed({this.city, this.expectedType});

  GetAutoCompleteGeoapifyResponseParsed.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    expectedType = json['expected_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['expected_type'] = expectedType;
    return data;
  }
}
