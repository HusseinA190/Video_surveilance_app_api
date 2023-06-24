import 'package:http/http.dart' as http;
import 'dart:convert';

void login() async {
  final url = Uri.parse('https://apica-production.up.railway.app/api/user/login/?Accept=application/json/');

  final headers = {
    'Accept': 'application/json',

    'Content-Type': 'application/json',
  };

  final body = {
    'email': 'ibrahem12@gmail.com',
    'password': '01032294804Aa',
  };

  final response = await http.post(url, headers: headers, body: jsonEncode(body));

  if (response.statusCode == 200) {
    // Login successful
    final responseData = jsonDecode(response.body);
    print(responseData);
    // Process the response data here
  } else if (response.statusCode == 401) {
    // Unauthorized error
    print('Unauthorized: ${response.body}');
    // Handle unauthorized error here
  } else {
    // Other error
    print('Error with status code: ${response.statusCode}');
    print('Error response: ${response.body}');

    // Handle other errors here
  }
}