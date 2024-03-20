import 'dart:convert';

import 'package:latlong2/latlong.dart';
import 'package:weatherforecasts/domain/models/models.dart';

import '../responses/responses.dart';
import 'package:http/http.dart' as http;

class GeoapifyService {
  GeoapifyService._();
  static Future<List<Suggestion>> getGeoapifyData(String query) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.geoapify.com/v1/geocode/search?text=$query&apiKey=294aa2188858442fb60715c5ba0c1c36'),
      );
      if (response.statusCode == 200) {
        final responseDecoded = GetAutoCompleteGeoapifyResponse.fromJson(json.decode(response.body));

        return responseDecoded.features?.map((e) {
              return Suggestion(
                  address: e.properties?.formatted ?? '',
                  latLng: LatLng(
                    e.properties?.lat?.toDouble() ?? 0,
                    e.properties?.lon?.toDouble() ?? 0,
                  ));
            }).toList() ??
            [];
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
