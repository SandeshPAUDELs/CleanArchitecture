import 'package:flutter/material.dart';

class TextThemes {
  static TextTheme createTextTheme(BuildContext context) {
    return TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        color: Theme.of(context).colorScheme.onSurface,
        overflow: TextOverflow.ellipsis,
      ),

      bodyLarge: TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.onSurface,
        overflow: TextOverflow.ellipsis,
      ),

      titleLarge: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),

      titleSmall: TextStyle(
        fontSize: 14,
        color: Theme.of(context).colorScheme.onSurface,
        overflow: TextOverflow.ellipsis,
      ),
      
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Theme.of(context).colorScheme.onSurface,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

