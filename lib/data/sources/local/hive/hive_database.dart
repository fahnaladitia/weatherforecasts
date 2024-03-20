import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';

class HiveDatabase {
  static Future<HiveDatabase> instance() async {
    await Hive.openBox('latLng');
    return HiveDatabase();
  }

  Future<void> saveLatLng(LatLng latLng) async {
    final box = Hive.box('latLng');
    await box.put('lat', latLng.latitude);
    await box.put('lng', latLng.longitude);
  }

  Future<LatLng?> getLatLng() async {
    final box = Hive.box('latLng');
    final lat = box.get('lat');
    final lng = box.get('lng');
    if (lat != null && lng != null) {
      return LatLng(lat, lng);
    }
    return null;
  }

  Future<void> clearLatLng() async {
    final box = await Hive.openBox('latLng');
    await box.clear();
  }
}
