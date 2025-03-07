import 'package:clean_arch/core/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Text(
                'Navigation',
                style: textTheme.displaySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutesName.searchProperties),
              child: ListTile(
                title: Text(
                  'Search Property',
                  style: textTheme.titleLarge,
                ),
              )),
          GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutesName.searchAddress),
              child: ListTile(
                title: Text(
                  'Search Property by Address',
                  style: textTheme.titleLarge,
                ),
              )),
          GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutesName.zpidSchool),
              child: ListTile(
                title: Text(
                  'ZPID Properties',
                  style: textTheme.titleLarge,
                ),
              )),
          GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutesName.photoProperties),
              child: ListTile(
                title: Text(
                  'Photo Properties',
                  style: textTheme.titleLarge,
                ),
              )),
          GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutesName.searchAgents),
              child: ListTile(
                title: Text(
                  'Search Agents',
                  style: textTheme.titleLarge,
                ),
              )),
          GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, AppRoutesName.searchAgentsByUsername),
              child: ListTile(
                title: Text(
                  'Search Agents by Username',
                  style: textTheme.titleLarge,
                ),
              )),
        ],
      ),
    );
  }
}
