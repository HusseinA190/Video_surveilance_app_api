import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/histoty_model/history_model.dart';
import '../../database/network/local_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'history_state.dart';
class HistoryCubit extends Cubit<HistoryStates> {
  HistoryCubit() : super(HistoryInitial());

  static HistoryCubit get(context) => BlocProvider.of(context);
  List<HistoryModel> history = [];

  void getHistory() async {
    emit(LoadingHistoryState());
    try{
      var response = await http.get(
          Uri.parse("https://apica-camapi.up.railway.app/api/user/history/?Accept=application/json/"),
          headers:
          {
            'Authorization': "Bearer ${CacheNetwork.getCacheData(key: 'token')}",
          }
      );
      print("HHHHHHHHHHHHHHHHHHHHHHH");
      print(response.statusCode);
      if (response.statusCode==200){
        final responsedata = jsonDecode(response.body);

        print("success");
        print(responsedata);
        for (var item in responsedata) {
          history.add(HistoryModel.fromJson(data: item));
        }
        emit(GetHistorySuccessState());
      } else {
        print("Wating");

      }
    }
    catch(e){
      print(e.toString());
      emit(FailedToGetHistoryState());
    }

  }
}





