import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';
import 'package:simple_weather/assets/themes/app_theme.dart';
import 'package:simple_weather/data/local_data_source/local_locations_data_source.dart';
import 'package:simple_weather/data/models/location_dto.dart';
import 'package:simple_weather/data/remote_data_source/remote_locations_data_source.dart';
import 'package:simple_weather/presentation/pages/select_location_page/select_location_page.dart';
import 'package:simple_weather/presentation/pages/welcome_page/welcome_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocationDtoAdapter());
  await Hive.openBox('locationsBox');
  LocalLocationsDataSource locationsDataSource = LocalLocationsDataSource();
  final locationsList = await locationsDataSource.getAllLocations();
  final isFirstUsage = locationsList.isEmpty;
  runApp( MyApp(isFirstUsage: isFirstUsage));
}

class MyApp extends StatelessWidget {
  final bool isFirstUsage;

  const MyApp({super.key, required this.isFirstUsage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      home: isFirstUsage ? const WelcomePage() : const SelectLocationPage()
    );
  }
}
