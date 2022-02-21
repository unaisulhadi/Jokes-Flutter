import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jokes_app/bindings/binding.dart';
import 'package:jokes_app/screens/home_screen.dart';
import 'package:jokes_app/screens/settings_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/home",
      initialBinding: Binding(),
      getPages: [
        GetPage(name: "/home", page: () => const HomeScreen()),
        GetPage(name: "/settings", page: () => const SettingsScreen()),
      ],
    );
  }
}
