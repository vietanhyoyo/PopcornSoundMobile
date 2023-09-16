import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:popcorn_sound_mobile/setup/routes/app.dart';
import 'package:popcorn_sound_mobile/setup/themes/appTheme.dart';

void main() {
  //Init flutter binding in project
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Using getX to control project
    return GetMaterialApp(
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.currentTheme.lightTheme,
      darkTheme: AppTheme.currentTheme.darkTheme,
    );
  }
}
