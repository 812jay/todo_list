import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/core/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/product',
      getPages: AppPages.routes,
    );
  }
}
