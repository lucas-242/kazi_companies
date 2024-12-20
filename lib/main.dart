import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:kazi_companies/app.dart';
import 'package:kazi_companies/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  setUrlStrategy(PathUrlStrategy());

  InjectionContainer.init();
  // Log.flow('Environment: ${Environment.environmentValue}');

  return runApp(const App());
}
