import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/rick_and_morty_app.dart';
import 'package:rick_and_morty/di/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const RickAndMortyApp());
}
