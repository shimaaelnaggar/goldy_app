import 'package:dio/dio.dart';
import 'package:goldy/core/data/api/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    final res = await dio.get(url, queryParameters: query);
    return res;
  }
}
