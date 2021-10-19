
import 'package:dio/dio.dart';
import 'package:my_start/ExpansionTileSample.dart';

class MyDioInstance
{
  static final MyDioInstance _instance = MyDioInstance._internal();
  factory MyDioInstance() => _instance;

  MyDioInstance._internal()
  {
    print("1111111111111111111111111");
    init();
  }

  late Dio _dio;

  init(){
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(baseOptions);
  }

  Future get(String url, {Map<String, dynamic>? params = null} ) async {
    try{
      var response = await _dio.get(url, queryParameters: params);
      return response.toString();
    } on DioError catch (e){
      return e.message;
    }
  }

  Future post (String url, {Map<String, dynamic>? params = null}) async
  {
    try{
      var response = await _dio.post(url, data: params == null ? null : params);
      return response.toString();
    } on DioError catch (e)
    {
      return e.message;
    }
  }


}