import 'package:flutter/material.dart';
import 'package:my_market_admin/core/functions/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.width = 100,
    this.height = 40,
    required this.onPressed,
    required this.child,
  });
  final double? width;
  final double? height;
  final Widget child;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
