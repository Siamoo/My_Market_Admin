import 'package:flutter/material.dart';
import 'package:my_market_admin/core/functions/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    required this.onPressed,
  });
  final double width;
  final double height;
  final Widget child;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kWhiteColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
