import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../helper/api_url.dart';
import '../helper/dio_helper.dart';
import '../model/LoginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  DioHelper _dioHelper = DioHelper();
  LoginModel loginModel = LoginModel();

  void login({
    required String email,
    required String password,
  }) async{
    emit(LoginLoadingState());
    try{
      final response = await _dioHelper.postData(
        path: ApiUrl.login,
        body: {
          "email": email,
          "password": password,
        },
      );
      loginModel= LoginModel.fromJson(response.data);
      if(loginModel.status==true){
        //HiveHelper.setToken(loginModel.data!.token!);
        DioHelper.headers["Authorization"]=loginModel.data?.token!;
        print("=====================================");
        print(loginModel.data?.token??"");
        // Get.offAll(MainScreen());
        log(response.data.toString());
        emit(LoginSuccessState());
      }else{
        Get.snackbar("Error", loginModel.message??"",backgroundColor: Colors.red);
        emit(LoginErrorState());
      }
    }catch(e){
      print(e.toString());
      emit(LoginErrorState());
    }

  }


}
