
import 'package:finalp/view_model/cubit/Sign_cubit/sign_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import '../../database/network/dio_semi.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  String name='taghreed';
  ///
  var formKey = GlobalKey<FormState>();

  String? validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
  //RegisterModel? registerModel;
  /*void signUp({required String name,required String email,required String password,required String password2}){

    DioHelper.postData(url: registerEndPoint,data:{
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'password2': password2Controller.text,


    })
        .then((value) => {debugPrint(value.data)})

        .catchError( (error){debugPrint(error.toString());})
    ;

  }*/
  void register(context) {

    emit(RegisterLoading());
    API().postData(url: 'https://apica-camapi.up.railway.app/api/user/register/?Accept=application/json/',
        body: {'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'password2': password2Controller.text,
          'tc':"false",})
        .then((value) {
      //print(value);
      // loginModel = LoginModel.fromJson(value.data);
      print(value["msg"]);
      emit(RegisterSuccess(value["msg"]));

      // print(loginModel!.data!.accessToken);
    }).catchError((e) {
      print(emailController.text);

      emit(RegisterError(e.toString()));
    });


  }
  // void register() {
  //   emit(RegisterLoading());
  //   DioHelper.postData(url: registerEndPoint, data: {
  //     'name': nameController.text,
  //     'email': emailController.text,
  //     'password': passwordController.text,
  //     'password2': password2Controller.text,
  //     'tc':false,
  //
  //   }).then((value) {
  //     debugPrint(value.data.toString());
  //     emit(RegisterSuccess(value.data["msg"]));
  //
  //   }).catchError((e) {
  //
  //     debugPrint(e.toString());
  //     emit(RegisterError(e.toString()));
  //   });
  // }



  void validateData(context) {
    if (formKey.currentState!.validate()) {
      register(context);
    }
  }

}
