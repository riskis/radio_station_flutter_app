import 'package:flutter/material.dart';
import 'package:radio_station_test/features/app/routes.dart';
import 'package:radio_station_test/features/app/themes.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      theme: AppThemes.themeData,
      routerConfig: AppRouter().generateRoute(),
    );
  }
}
