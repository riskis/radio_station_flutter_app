import 'package:flutter/material.dart';
import 'package:radio_station_test/core/di/service_locator.dart';

import 'features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MainApp());
}
