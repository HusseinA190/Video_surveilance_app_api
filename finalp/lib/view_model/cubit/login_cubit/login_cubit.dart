import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalp/model/login_model/login_model.dart';
import 'package:finalp/shared/components.dart';
import 'package:finalp/layout/home_layout.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/dio_semi.dart';
import '../../database/network/end_points.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  IconData suffixIcon = Icons.visibility;
  bool isPasswordShown = true;

  void changePasswordIcon() {
    isPasswordShown = !isPasswordShown;


    suffixIcon = isPasswordShown ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordIconState());
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel? loginModel;

  void login(context) {

    emit(LoginLoading());
    API().postData(url: 'https://apica-camapi.up.railway.app/api/user/login/?Accept=application/json/',
        body: {'email': emailController.text,
      'password':  passwordController.text,})
    .then((value) {
            print(value);
      // loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccess());

     // print(loginModel!.data!.accessToken);
    }).catchError((e) {
       print(emailController.text);

      emit(LoginError());
   });
//     DioHelper.postData(url: loginEndPoint, data: {
//       'email': 'ibrahem12@gmail.com',
//       'password': '01032294804Aa',
//     }).then((value) {
// print(value.statusCode);
//       loginModel = LoginModel.fromJson(value.data);
//       emit(LoginSuccess());
//
//       navigateAndFinish(
//           context, HomeLayout()); // print(loginModel!.data!.accessToken);
//     }).catchError((e) {
// print(e.toString());
//       emit(LoginError());
//     });
  }

  void validateData(context) {

    if (
    formKey.currentState!.validate()) {

      login(context);
    }
  }
}
