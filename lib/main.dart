import 'package:clean_arch/app/my_app.dart';
import 'package:clean_arch/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  initializeServiceLocator();
  runApp(const MyApp());
}
