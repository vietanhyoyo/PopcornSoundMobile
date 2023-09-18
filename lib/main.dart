import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:popcorn_sound_mobile/services/firebase_api.dart';
import 'package:popcorn_sound_mobile/setup/routes/app.dart';
import 'package:popcorn_sound_mobile/setup/themes/appTheme.dart';

void main() async {
  //Init flutter binding in project
  WidgetsFlutterBinding.ensureInitialized();

  //Init Firebase service
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  //Init Advertising
  var devices = ["45517DD5229E38380ED8E5109086A732"];
  await MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration = RequestConfiguration(
    testDeviceIds: devices
  );
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);

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
