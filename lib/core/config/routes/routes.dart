import 'package:clean_arch/core/config/routes/routes_name.dart';
import 'package:clean_arch/module/presentation/screens/home_screen.dart';
import 'package:clean_arch/module/presentation/screens/lenders/lenders_details.dart';
import 'package:clean_arch/module/presentation/screens/lenders/lenders_search.dart';
import 'package:clean_arch/module/presentation/screens/properties/search_properties.dart';
import 'package:clean_arch/module/presentation/screens/properties/search_properties_by_address.dart';
import 'package:clean_arch/module/presentation/screens/property_details_zpid/proprty_school.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case AppRoutesName.searchAddress:
        return MaterialPageRoute(
          builder: (context) => SearchPropertiesByAddress(),
        );

      case AppRoutesName.searchProperties:
        return MaterialPageRoute(
          builder: (context) => SearchProperties(),
        );

      case AppRoutesName.zpidSchool:
        return MaterialPageRoute(
          builder: (context) => ZPIDPropertySchool(),
        );

      case AppRoutesName.lendersSearch:
        return MaterialPageRoute(
          builder: (context) => LendersSearch(),
        );

      case AppRoutesName.lendersDetail:
        return MaterialPageRoute(
          builder: (context) => LendersDetails(),
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
