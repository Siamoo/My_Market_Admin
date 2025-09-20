import 'package:flutter/material.dart';
import 'package:my_market_admin/core/functions/app_colors.dart';
import 'package:my_market_admin/core/functions/navigation_service.dart';
import 'package:my_market_admin/features/home/views/home_view.dart';

AppBar customAppBar(
  BuildContext context,
  String title, {
  bool? isBackButton = true,
  bool? isHomeButton = true,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: AppColors.kWhiteColor),
    ),
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
    actions: [
      if (isHomeButton == true)
        IconButton(
          onPressed: () {
            NavigationService.pushReplacementTo(context, HomeView());
          },
          icon: const Icon(
            Icons.home,
            color: AppColors.kWhiteColor,
          ),
        ),
    ],
  );
}
