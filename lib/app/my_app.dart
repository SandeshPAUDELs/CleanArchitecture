import 'package:clean_arch/core/config/routes/routes.dart';
import 'package:clean_arch/core/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutesName.homeScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}