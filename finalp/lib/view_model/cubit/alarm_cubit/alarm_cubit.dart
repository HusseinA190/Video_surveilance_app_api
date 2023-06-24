import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/alarams_model/alaram_model.dart';
import '../../database/network/constant.dart';
import '../../database/network/local_network.dart';
import 'alarms_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AlarmsCubit extends Cubit<AlarmStates> {
  AlarmsCubit() : super(AlarmInitial());
  static AlarmsCubit get(context) => BlocProvider.of(context);
  AlarmModel? alarm;
  List<String>? ids =[] ;
  SharedPreferences? pre;
  int? old_id;
  int? new_id;
  void getAlarms() async {
    String token;
    emit(LoadingAlarmsState());

    try{

      var response = await http.get(
          Uri.parse("https://apica-camapi.up.railway.app/api/user/alarm/?Accept=application/json/"),
          headers:
          {
            'Authorization': "Bearer ${CacheNetwork.getCacheData(key: 'token')}",
          }
      );
      if (response.statusCode == 200) {
        alarm = AlarmModel.fromJson(data:jsonDecode(response.body));
        print(jsonDecode(response.body));
        emit(GetAlarmsSuccessState());
      }
    }

   catch(e){
      print(e.toString());

   }
  }

}



