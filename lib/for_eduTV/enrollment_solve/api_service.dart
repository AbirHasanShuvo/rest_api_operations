// services/enrollment_service.dart
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class EnrollmentService extends GetxService {
  static const String _baseUrl = 'https://admin.edubd.tv/api/v1';
  static const String _token = '4148|GmbGByOLzqjrQCpVDUYEPRdJf4lpxkMUFjiBjZBl';

  Future<EnrollmentResponse> getEnrollments() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/enrollments'),
        headers: {
          'Authorization': 'Bearer $_token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return EnrollmentResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load enrollments: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load enrollments: $e');
    }
  }
}