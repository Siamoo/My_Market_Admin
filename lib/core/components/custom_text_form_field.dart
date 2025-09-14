import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_market_admin/core/functions/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.labelText,
    this.suffixIcon,
    this.onChanged, this.inputFormatters, this.keyboardType,
  });

  final TextEditingController? controller;
  final String labelText;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        cursorColor: AppColors.kWhiteColor,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 14, color: AppColors.kGreyColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kBordersideColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kBordersideColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kBordersideColor),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          suffixIcon: suffixIcon,
        ),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $labelText';
          }
          return null;
        },
      ),
    );
  }
}
