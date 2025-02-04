import 'package:restapi_testing/model/custom_user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<List<CustomUserModel>> fetchUser() async {
    //without static it can't be call
    // print('fetch user');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      return CustomUserModel.fromJson(e);
    }).toList();

    return users;
  }
}
