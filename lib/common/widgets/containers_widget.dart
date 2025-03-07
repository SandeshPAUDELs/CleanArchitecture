import 'package:clean_arch/common/style/common_style.dart';
import 'package:flutter/material.dart';

class ContainersforPages {
  static ListTile containerforSearchProperties(
      BuildContext context,
      String image,
      String countryName,
      String cityName,
      String currency,
      String status) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      title: Text(countryName),
      subtitle: Text('$cityName, $currency'),
      trailing: Container(
        padding: const EdgeInsets.all(CommonStyle.smallPadding),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(CommonStyle.smallBorderRadius),
        ),
        child: Text(status),
      ),
    );
  }

  // for search properties by address
  static Column containerforSearchPropertiesByAddress(
      BuildContext context,
      String image,
      String abbreviatedAddress,
      String city,
      String state,
      String streetAddress,
      String zipcode,
      String description) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: 200,
        ),
        Text(
          abbreviatedAddress,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
        ),
        Text('City: $city', style: Theme.of(context).textTheme.titleMedium),
        Text('State: $state', style: Theme.of(context).textTheme.titleMedium),
        Text('Street: $streetAddress',
            style: Theme.of(context).textTheme.titleMedium),
        Text('Zipcode: $zipcode',
            style: Theme.of(context).textTheme.titleMedium),
        const Divider(),
        Text(
          'Description',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 24,
        ),
      ],
    );
  }

  // for zpid properties
  static Column containerforZpidProperties(
      BuildContext context,
      String abbreviatedAddress,
      String city,
      String state,
      String streetAddress,
      String zipcode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          abbreviatedAddress,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
        ),
        Text('City: $city', style: Theme.of(context).textTheme.titleMedium),
        Text('State: $state', style: Theme.of(context).textTheme.titleMedium),
        Text('Street: $streetAddress',
            style: Theme.of(context).textTheme.titleMedium),
        Text('Zipcode: $zipcode',
            style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
