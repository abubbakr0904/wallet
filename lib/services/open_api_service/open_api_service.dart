import 'package:dio/dio.dart';
import 'package:wallet/data/local/storage_repository.dart';
import 'package:wallet/data/models/login_model/login_model.dart';
import 'package:wallet/data/responses/my_response.dart';

class OpenApiService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://online.atomic.uz',
  ));

  Future<MyResponse> walletLogin({required String username, required String password}) async {
    MyResponse myResponse = MyResponse(errorMessage: "");
    try {
      Response response = await dio.post(
        "/api/login",
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data != null) {
          var responseData = LoginModel.fromJson(response.data);
          myResponse.data = responseData;
          await StorageRepository.putString('token', responseData.token);
        } else {
          myResponse.errorMessage = "No data received";
        }
      } else {
        myResponse.errorMessage = "Error: ${response.statusCode}";
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          myResponse.errorMessage = e.response!.data['message'] ?? "DioError occurred";
        } else {
          myResponse.errorMessage = "DioError occurred without response data";
        }
      } else {
        myResponse.errorMessage = e.toString();
      }
    }
    return myResponse;
  }

  Future<MyResponse> walletRegister({
    required String username,
    required String password,
    required String surname,
    required String name,
  }) async {
    MyResponse myResponse = MyResponse(errorMessage: "");
    try {
      Response response = await dio.post(
        "/api/register",
        data: {
          "username": username,
          "password": password,
          "surname": surname,
          "name": name,
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = response.data;
      } else {
        myResponse.errorMessage = "Error: ${response.statusCode}";
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          myResponse.errorMessage = e.response!.data['message'] ?? "DioError occurred";
        } else {
          myResponse.errorMessage = "DioError occurred without response data";
        }
      } else {
        myResponse.errorMessage = e.toString();
      }
    }
    return myResponse;
  }
}
