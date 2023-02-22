import 'package:arfilming/src/application.dart';
import 'package:arfilming/src/service_locator.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await di.initialize();

  const app = Application();
  runApp(app);
}
