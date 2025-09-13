import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market_admin/core/functions/api_services.dart';
import 'package:my_market_admin/core/functions/shared_pref.dart';
import 'package:my_market_admin/features/products/models/products.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  List<Products> products = [];
  final ApiServices apiServices = ApiServices();
  Future<void> getProducts() async {
    emit(GetProductsLoading());
    try {
      String? token = await SharedPref.getToken();
      final response = await apiServices.getData('products_table', token);
      for (var product in response.data) {
        products.add(Products.fromJson(product));
      }
      if (response.statusCode == 200) {
        emit(GetProductsSuccess());
      }
    } catch (e) {
      emit(GetProductsError());
    }
  }
}
