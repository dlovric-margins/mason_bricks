import 'package:dio/dio.dart';
import 'package:{{project_name.snakeCase()}}/app/services/service_locator.dart';
import 'package:{{project_name.snakeCase()}}/app/storage/{{project_name.snakeCase()}}_secure_storage.dart';
import 'package:{{project_name.snakeCase()}}/env/env.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


@module
abstract class DioModule {
  Dio get dio {
    final dio = Dio();

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        logPrint: logInfo,
      ),
    );

    dio.options.baseUrl = Env.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 7);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _addAuthorizationHeader,
        onResponse: (Response<dynamic> response, handler) {
          return handler.next(response);
        },
        onError: _handleError,
      ),
    );

    return dio;
  }

  Future<void> _addAuthorizationHeader(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await sl<SecureStorage>().getAccessToken();
    // final _version = await AppHandler.appVersion();
    // final _platform = Platform.isAndroid ? 'Android' : 'iOS';

    options.headers.addAll(<String, dynamic>{
      // 'X-Build-Number': _version,
      // 'X-Platform': _platform,
      'Authorization': 'Bearer $token',
    });
    logInfo('Bearer $token');
    return handler.next(options);
  }

  Future<void> _handleError(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    //Implement error handling

    return handler.next(error);
  }
}
