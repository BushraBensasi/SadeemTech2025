import 'package:dio/dio.dart';
import 'package:sadeem/core/constants/constants.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: sadeemBaseAPI,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getRequest({required String endpoint}) async {
    if (dio == null) {
      throw Exception('Dio not initialized. Call DioHelper.init() first');
    }
    return await dio!.get(endpoint);
  }
}
