import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.titlePrimaryText,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.titleSecondaryText,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
  );

  static const TextStyle comments = TextStyle(
    fontSize: 12,
  );
}