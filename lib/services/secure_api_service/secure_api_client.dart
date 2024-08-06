import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wallet/data/local/storage_repository.dart';
import 'package:wallet/utils/constants/app_constants.dart';
import 'package:wallet/utils/custom_exeptions/custom_exceptions.dart';

class SecureApiClient {
  SecureApiClient() {
    _init();
  }

  late Dio dio;

  _init() {
    dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 33000),
    ));

    dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      switch (error.type) {
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
          throw DeadlineExceededException(error.requestOptions);
        case DioErrorType.receiveTimeout:
          throw ReceiveTimeOutException(error.requestOptions);
        case DioErrorType.badResponse:
          switch (error.response?.statusCode) {
          // case 401:
          //   throw UnauthorizedException(error.requestOptions);
          // case 404:
          //   throw NotFoundException(error.requestOptions);
          // case 409:
          //   throw ConflictException(error.requestOptions);
          // case 500:
          // case 501:
          // case 503:
          //   throw InternalServerErrorException(error.requestOptions);
          }
          break;
        case DioErrorType.cancel:
          throw CancelException(error.requestOptions);
        case DioErrorType.badCertificate:
          throw BadCertificateException(error.requestOptions);
        case DioErrorType.connectionError:
          throw NoInternetConnectionException(error.requestOptions);
        case DioErrorType.unknown:
          throw UnkownException(error.requestOptions);
      }
      debugPrint('Error Status Code:${error.response?.statusCode}');
      return handler.next(error);
    }, onRequest: (requestOptions, handler) async {
      String? token = await StorageRepository.getString('token');
      if (token != null) {
        requestOptions.headers["Authorization"] = "Bearer $token";
      }
      requestOptions.headers["accept"] = "application/json";
      return handler.next(requestOptions);
    }, onResponse: (response, handler) {
      print("Response has received");
      return handler.next(response);
    }));
  }
}
