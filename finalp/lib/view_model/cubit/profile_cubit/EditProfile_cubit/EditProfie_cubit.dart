import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../model/profile_model/EditProfile_model.dart';
import '../../../database/network/local_network.dart';
import 'EditProfile_states.dart';
class EditProfileCubit extends Cubit<EditProfieStates> {
  EditProfileCubit() : super(EditProfieInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);
  EditProfileModel? editProfile;
  void PostprofileData({required String Name, required String Email}  ) async {
   // print("1111111111111");
    emit(LoadingEditProfie());
   // print("222222222222");
    try{
     // print("3333333333");
      print (CacheNetwork.getCacheData(key: "id"));
      var response = await http.put(
        Uri.parse("https://apica-camapi.up.railway.app/api/user/mymodels/${CacheNetwork.getCacheData(key: "id")}/?Accept=application/json/"),
        headers:
        {
          'Authorization': "Bearer ${CacheNetwork.getCacheData(key: 'token')}",
        },
        body: {
          'email': Email,
          'name': Name,
          'id':CacheNetwork.getCacheData(key: "id")




        },
      );
      if (response.statusCode == 200) {
        debugPrint("succssesssssssssssss");
        emit(GetEditProfieSuccessState());
      }
    }
    catch(e){


      emit(EditProfieInitial());
      print(e.toString());
     // print("44444444444444");
     // print("44444444444444");

    }
  }


}
