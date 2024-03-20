import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weatherforecasts/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/my_app.dart';

Future<void> main() async {
  // Initialize flutter
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // await ScreenUtil.ensureScreenSize();
  initializeDateFormatting('id_ID', null);

  // Initialize system chrome
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await DependencyInjection.initialize();

  runApp(const MyApp());
}
