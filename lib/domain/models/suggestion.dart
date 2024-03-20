// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:latlong2/latlong.dart';

class Suggestion {
  final String address;
  final LatLng latLng;
  Suggestion({
    required this.address,
    required this.latLng,
  });

  @override
  String toString() => 'Suggestion(address: $address, latLng: $latLng)';
}
