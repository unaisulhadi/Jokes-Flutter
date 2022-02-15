import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/bindings/binding.dart';
import 'package:jokes_app/screens/home_screen.dart';

void main() {
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
      getPages: [
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: HomeBinding())
      ],
    );
  }
}
