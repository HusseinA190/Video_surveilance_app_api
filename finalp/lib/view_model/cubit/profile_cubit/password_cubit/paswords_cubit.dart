import 'package:finalp/view_model/cubit/profile_cubit/password_cubit/pass_state.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../model/profile_model/password_model.dart';
import '../../../database/network/local_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PassCubit extends Cubit<passStates> {
  PassCubit() : super(PassInitial());

  static PassCubit get(context) => BlocProvider.of(context);
  PassModel? alarm;
  void PostPassData({required String p, required String p2}  ) async {
    //String token;
    emit(LoadingPassState());
    //debugPrint("قبل الترااااااااااااااي");

    try{

      var response = await http.post(
          Uri.parse("https://apica-camapi.up.railway.app/api/user/changepassword/?Accept=application/json/"),
          headers:
          {
            'Authorization': "Bearer ${CacheNetwork.getCacheData(key: 'token')}",
          },
        body: {
          'password': p,
          'password2': p2,

        },
      );
      if (response.statusCode == 200) {
         debugPrint("succssesssssssssssss");
        emit(GetPassSuccessState());
      }
    }
    catch(e){
      //debugPrint("بعد الترااااااااااااااي");
      emit(FailedToGetPassState());
      print(e.toString());

    }
  }


}
