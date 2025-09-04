import 'package:flutter/material.dart';
import 'package:my_market_admin/core/functions/app_colors.dart';

AppBar customAppBar(
  BuildContext context,
  String title, {
  bool? isBackButton = false,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: TextStyle(color: AppColors.kWhiteColor)),
    backgroundColor: AppColors.kPrimaryColor,
    leading: isBackButton == true
        ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.kWhiteColor,
            ),
          )
        : Container(),
  );
}
