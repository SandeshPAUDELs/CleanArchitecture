import 'package:clean_arch/core/config/routes/routes_name.dart';
import 'package:clean_arch/module/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text("No Route Generated"),
            ),
          );
        });
    }
  }
}
