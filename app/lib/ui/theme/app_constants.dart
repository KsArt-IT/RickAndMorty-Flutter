import 'package:flutter/material.dart';

sealed class AppConstants {}

sealed class Strings extends AppConstants {
  static const String appName = 'Rick and Morty';
}

sealed class Dimens extends AppConstants {
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
}

sealed class Sizes extends AppConstants {
  static final borderRadius = BorderRadius.circular(10);

  static const double image = 250;

  static const double titleSize = 24;
}
