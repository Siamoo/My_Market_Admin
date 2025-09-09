import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_market_admin/core/functions/api_services.dart';

part 'add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit() : super(AddAdminInitial());

  final ApiServices _apiServices = ApiServices();

  Future<void> creartAnAccount(Map<String, dynamic> data) async {
    emit(CreateAdminLoading());
    try { 
      Response response = await _apiServices.createAnAccount('signup', data);
      if (response.statusCode == 200) {
        emit(CreateAdminSuccess());
      } else {
        emit(CreateAdminError(response.data['msg']));
      }
    } catch (e) {
      emit(CreateAdminError(e.toString()));
    }
  }
}
  