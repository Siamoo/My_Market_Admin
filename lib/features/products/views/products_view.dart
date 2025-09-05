import 'package:flutter/material.dart';
import 'package:my_market_admin/core/components/custom_product_card.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Products'),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const CustomProductCard(),
      ),
    );
  }
}
