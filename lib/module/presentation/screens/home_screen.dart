import 'package:clean_arch/common/widgets/app_bar_widget.dart';
import 'package:clean_arch/core/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      {
        'title': 'Properties Search',
        'route': AppRoutesName.searchProperties,
      },
      {
        'title': 'Properties Search by Address',
        'route': AppRoutesName.searchAddress,
      },
      {
        'title': 'ZPID Properties',
        'route': AppRoutesName.zpidSchool,
      },
      {
        'title': 'Photo Properties',
        'route': AppRoutesName.photoProperties,
      },
      {
        'title': 'Search Agents',
        'route': AppRoutesName.searchAgents,
      },
      
    ];
    return Scaffold(
      appBar: CustomAppBarTheme.appBarforPages(context, 'Home'),
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          final screen = screens[index];
          return Card(
            child: ListTile(
              title: Text(screen['title']!),
              onTap: () {
                Navigator.pushNamed(context, screen['route']!);
              },
            ),
          );
        },
      ),
    );
  }
}