import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quoran/screen/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}
