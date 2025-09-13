import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market_admin/core/functions/api_services.dart';
import 'package:my_market_admin/core/functions/shared_pref.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  final ApiServices apiServices = ApiServices();
  Future<void> getProducts() async {
    emit(GetProductsLoading());
    try {
    String?  token = await SharedPref.getToken();
      final response = await apiServices.getData('products_table', token);      
      if (response.statusCode == 200) {
        print(response.data);
        emit(GetProductsSuccess());
      }
    } catch (e) {
      print(e);
      emit(GetProductsError());
    }
  }
}
