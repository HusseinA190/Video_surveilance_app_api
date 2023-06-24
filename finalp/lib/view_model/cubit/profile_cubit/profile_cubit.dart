import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/profile_model/profile_model.dart';
import '../../database/network/local_network.dart';
import 'profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileModel? profile_data;
  void getProfieData() async {
    String token;
    emit(LoadingProfileState());

    try{
      CacheNetwork.getCacheData(key: 'token');

      var response = await http.get(
          Uri.parse("https://apica-camapi.up.railway.app/api/user/user/?Accept=application/json/"),
          headers:
          {
            'Authorization': "Bearer ${CacheNetwork.getCacheData(key: 'token')}",
          }
      );
      print(  response.statusCode);
      if (response.statusCode == 200) {
        profile_data = ProfileModel.fromJson(data:jsonDecode(response.body));
        print(jsonDecode(response.body));
        emit(GetProfileSuccessState());
      }
    }
    catch(e){
      print(e.toString());

    }
  }
}



