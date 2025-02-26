import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/news_controller.dart';
import 'controllers/favorites_controller.dart';
import 'screens/splash_screen.dart';

void main() {
  Get.put(NewsController());
  Get.put(FavoritesController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Aggregator',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
