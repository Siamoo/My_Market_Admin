import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market_admin/core/components/custom_product_card.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';
import 'package:my_market_admin/features/products/cubit/cubit/products_cubit.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar(context, 'Products'),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const CustomProductCard(),
            ),
          );
        },
      ),
    );
  }
}
