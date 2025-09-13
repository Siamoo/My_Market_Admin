import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market_admin/core/functions/api_services.dart';
import 'package:my_market_admin/core/functions/shared_pref.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final ApiServices _apiServices = ApiServices();
  Future<void> login(Map<String, dynamic> data) async {
    emit(LoginLoading());
    try {
      Response response = await _apiServices.login('token', data);
      if (response.statusCode == 200) {
        SharedPref.saveToken(response.data['access_token']);
        emit(LoginSuccess());
      } else {
        emit(LoginError(response.data['msg']));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
