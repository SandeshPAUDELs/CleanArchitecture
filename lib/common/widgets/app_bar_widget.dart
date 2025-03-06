import 'package:flutter/material.dart';

class CustomAppBarTheme {
  static AppBar appBarforPages(BuildContext context, String titleText) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        titleText,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      elevation: 20.0, 
      shadowColor: Theme.of(context).colorScheme.shadow,
      toolbarHeight:
          kToolbarHeight + (MediaQuery.of(context).size.height * 0.01),
      leading: Builder(builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
          },
        );
      }),
    );

  }
}