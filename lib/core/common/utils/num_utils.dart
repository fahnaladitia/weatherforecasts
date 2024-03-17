import 'package:intl/intl.dart';

extension NumUtils on num {
  // ToRupiah
  String get toRupiah {
    final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
    return formatter.format(this);
  }
}
