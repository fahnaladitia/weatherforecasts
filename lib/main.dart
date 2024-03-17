import 'package:weatherforecasts/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/my_app.dart';

Future<void> main() async {
  // Initialize flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize system chrome
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await DependencyInjection.initialize();

  runApp(const MyApp());
}
