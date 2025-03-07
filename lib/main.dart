import 'package:clean_arch/app/my_app.dart';
import 'package:clean_arch/service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  initializeServiceLocator();
  runApp(DevicePreview(builder: (BuildContext context) =>  const MyApp()));
}
