import 'package:dio/dio.dart';

class DioHelper {
  final _dio =
      Dio();

  Future<CustomResponse> get(
    String endPoint,
  ) async {
    try {
      final response = await _dio.get(
        endPoint,
      );
      print(response.data);
      return CustomResponse(isSuccess: true, response: response);
    } on DioException catch (ex) {
      print(ex.response?.data);

      return CustomResponse(
        isSuccess: false,
      );
    }
  }

  Future<CustomResponse> post(String endPoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: FormData.fromMap(data ?? {}),
      );
      print(response.data);
      return CustomResponse(isSuccess: true, response: response);
    } on DioException catch (ex) {
      print(ex.response?.data);
      return CustomResponse(
        isSuccess: false,
      );
    }
  }
}

class CustomResponse {
  final Response? response;

  final bool isSuccess;

  CustomResponse({this.response, required this.isSuccess});
}
