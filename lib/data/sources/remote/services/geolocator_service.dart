import 'package:geolocator/geolocator.dart';
import 'package:weatherforecasts/core/common/common.dart';

class GeolocatorService {
  GeolocatorService._();

  static Future<Position> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw GeneralException(
          message: 'Location permissions are denied',
          code: 'PERMISSION_DENIED',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw GeneralException(
        message: 'Location permissions are permanently denied, we cannot request permissions.',
        code: 'PERMISSION_DENIED_FOREVER',
      );
    }

    try {
      final position = await Geolocator.getCurrentPosition();

      return position;
    } catch (e) {
      logger.e(e);
      throw GeneralException(
        message: 'Failed to get current position: $e',
        code: 'FAILED_GET_CURRENT_POSITION',
      );
    }
  }
}
