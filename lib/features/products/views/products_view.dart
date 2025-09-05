import 'package:flutter/material.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(context, 'Products'),
    );
  }
}