import 'package:flutter/material.dart';

class HintDescriptionWidget extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;

  const HintDescriptionWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 70),
          Icon(
            icon,
            size: 200,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}