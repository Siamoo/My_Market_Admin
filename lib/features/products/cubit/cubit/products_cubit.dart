import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market_admin/core/functions/api_services.dart';
import 'package:my_market_admin/core/functions/sensitive_data.dart';
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

  String imageUrl = '';
  Future<void> uploadimage({
    required Uint8List image,
    required String iamgeName,
    required bucketName,
  }) async {
    const String storageBaseUrl =
        'https://rmmvawnbnfdsyjbgturm.supabase.co/storage/v1/object';
    const String apiKey = anonkey;
    final String? token = await SharedPref.getToken();
    final String url = '$storageBaseUrl/$bucketName/$iamgeName';
    final Dio dio = Dio();
    final FormData formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(image, filename: iamgeName),
    });
    emit(UploadImageLoading());

    try {
      Response response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'apikey': apiKey,
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        imageUrl =
            'https://rmmvawnbnfdsyjbgturm.supabase.co/storage/v1/object/public/${response.data['Key']}';

        emit(UploadImageSuccess());
      }
    } catch (e) {
      emit(UploadImageError());
    }
  }

  Future<void> editProduct({
    required Map<String, dynamic> data,
    required String productId,
  }) async {
    emit(EditProductLoading());
    try {
      String? token = await SharedPref.getToken();
      Response response = await apiServices.patchData(
        'products_table?id=eq.$productId',
        data,
        token,
      );
      if (response.statusCode == 204) {
        emit(EditProductSuccess());
      }
    } catch (e) {
      emit(EditProductError());
    }
  }

  Future<void> deleteProduct({required String productId}) async {
    emit(DeleteProductLoading());
    try {
      String? token = await SharedPref.getToken();
      Response response1 = await apiServices.deleteData(
        'comments_table?for_product=eq.$productId',
        token,
      );
      Response response2 = await apiServices.deleteData(
        'favorite_products?for_product=eq.$productId',
        token,
      );
      Response response3 = await apiServices.deleteData(
        'purchase_table?for_product=eq.$productId',
        token,
      );
      Response response4 = await apiServices.deleteData(
        'rates_table?for_product=eq.$productId',
        token,
      );
      Response response5 = await apiServices.deleteData(
        'products_table?id=eq.$productId',
        token,
      );
      if (response5.statusCode == 204 &&
          response1.statusCode == 204 &&
          response2.statusCode == 204 &&
          response3.statusCode == 204 &&
          response4.statusCode == 204) {
        emit(DeleteProductSuccess());
      }
    } catch (e) {
      emit(DeleteProductError());
    }
  }
}
