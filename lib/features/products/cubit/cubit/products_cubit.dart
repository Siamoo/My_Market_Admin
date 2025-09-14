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
    const String _storageBaseUrl =
        'https://rmmvawnbnfdsyjbgturm.supabase.co/storage/v1/object';
    const String apiKey = anonkey;
    final String? token = await SharedPref.getToken();
    final String url = '$_storageBaseUrl/$bucketName/$iamgeName';
    final Dio _dio = Dio();
    final FormData formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(image, filename: iamgeName),
    });
    emit(UploadImageLoading());

    try {
      Response response = await _dio.post(
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
        imageUrl = 'https://rmmvawnbnfdsyjbgturm.supabase.co/storage/v1/object/public/${response.data['Key']}';
        
        print(response.data['Key']);
        emit(UploadImageSuccess());
      }
    } catch (e) {
      emit(UploadImageError());
    }
  }
}
