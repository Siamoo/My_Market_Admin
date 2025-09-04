import 'package:flutter/material.dart';
import 'package:my_market_admin/core/functions/app_colors.dart';

void showAppSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: AppColors.kPrimaryColor),
  );
}
