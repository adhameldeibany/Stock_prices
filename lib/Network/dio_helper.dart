import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  //https://www.goldapi.io/api/XAU/USD/

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://www.goldapi.io/api/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData(String url){
    dio!.options.headers={
      'x-access-token':'goldapi-bwjhhurlggoikhr-io'
    };


    return dio!.get(url);
  }
}