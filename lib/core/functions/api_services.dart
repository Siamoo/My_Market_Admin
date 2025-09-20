import 'package:dio/dio.dart';
import 'package:my_market_admin/core/functions/sensitive_data.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rmmvawnbnfdsyjbgturm.supabase.co/rest/v1/',
      headers: {'apikey': anonkey},
    ),
  );
  Future<Response> getData(String endponit, String? token) async {
    return await _dio.get(
      endponit,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<Response> postData(String endponit, Map<String, dynamic> data) async {
    return await _dio.post(endponit, data: data);
  }

  Future<Response> patchData(
    String endponit,
    Map<String, dynamic> data,
    String? token,
  ) async {
    return await _dio.patch(
      endponit,
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<Response> deleteData(String endponit, String? token,) async {
    return await _dio.delete(endponit, options: Options(headers: {'Authorization': 'Bearer $token'}),);
  }

  final Dio _dioauth = Dio(
    BaseOptions(
      baseUrl: 'https://rmmvawnbnfdsyjbgturm.supabase.co/auth/v1/',
      headers: {'apikey': anonkey},
    ),
  );

  Future<Response> createAnAccount(
    String endponit,
    Map<String, dynamic> data,
  ) async {
    return await _dioauth.post(endponit, data: data);
  }

  Future<Response> login(String endponit, Map<String, dynamic> data) async {
    return await _dioauth.post(
      endponit,
      data: data,
      queryParameters: {'grant_type': 'password'},
    );
  }
}
