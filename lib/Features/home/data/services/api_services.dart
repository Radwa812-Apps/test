import 'package:dio/dio.dart';

class ApiServices {
  final String baseurl = 'https://www.googleapis.com/books/v1/';

  final Dio _dio;

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response =
        await _dio.get('$baseurl$endPoint');

    return response.data;
  }
}
