import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market_admin/core/components/custom_product_card.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';
import 'package:my_market_admin/core/functions/navigation_service.dart';
import 'package:my_market_admin/features/products/cubit/cubit/products_cubit.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is DeleteProductSuccess) {
            NavigationService.navigateWithoutBack(context, const ProductsView());
          }
         
        },
        builder: (context, state) {
          ProductsCubit cubit = context.read<ProductsCubit>();
          return Scaffold(
            appBar: customAppBar(context, 'Products'),
            body: state is GetProductsLoading || state is DeleteProductLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
              itemCount: cubit.products.length,
              itemBuilder: (context, index) =>  CustomProductCard( product: cubit.products[index], onPressed: () => cubit.deleteProduct(productId: cubit.products[index].id! ),),
            ),
          );
        },
      ),
    );
  }
}
