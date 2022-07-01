import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_notes/core/theme/theme.dart';

import './core/initilization/initialization.dart';
import './page/home/home_page.dart';

void main() async => await initApp();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
