import 'package:clean_arch/core/config/routes/routes_name.dart';
import 'package:clean_arch/module/presentation/screens/agents/search_agents.dart';
import 'package:clean_arch/module/presentation/screens/home_screen.dart';
import 'package:clean_arch/module/presentation/screens/properties/search_properties.dart';
import 'package:clean_arch/module/presentation/screens/properties/search_properties_by_address.dart';
import 'package:clean_arch/module/presentation/screens/property_details_zpid/photo_property.dart';
import 'package:clean_arch/module/presentation/screens/property_details_zpid/zpid_property_v2.dart';
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
          builder: (context) => ZPIDPropertyV2(),
        );

      case AppRoutesName.photoProperties:
        return MaterialPageRoute(
          builder: (context) => PhotoProperty(),
        );
      
      case AppRoutesName.searchAgents:
        return MaterialPageRoute(
          builder: (context) => SearchAgents(),
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
