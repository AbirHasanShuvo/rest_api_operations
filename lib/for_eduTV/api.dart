import 'dart:convert';

import 'package:restapi_testing/for_eduTV/model.dart';
import 'package:http/http.dart' as http;

class EduTvAPI {
  static Future<List<EduTvModel>> fetchCategoriesData(url) async {
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["data"]["data"] as List<dynamic>;

    final alldata = results.map((e) {
      return EduTvModel.fromJson(e);
    }).toList();

    return alldata;
  }
}
