import 'dart:convert';

import 'package:finalp/view_model/database/network/local_network.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../model/alarams_model/alaram_model.dart';

class API {
  Future<List<dynamic>> getData(
      {required String url,  String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception('Error with status code ');
    }
  }

  Future<dynamic> postData(
      {required String url, required dynamic body }) async {
    Map<String, String> headers = {};

    Response response =
    await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 201 || response.statusCode == 200  ) {
      var responseData = jsonDecode(response.body);
     await  CacheNetwork.insertToCache(key: "token" ,  value: responseData['token']['access']);
      return responseData;

    } else {
      throw Exception('${response.statusCode} && ${response.body}');
    }
  }
}

