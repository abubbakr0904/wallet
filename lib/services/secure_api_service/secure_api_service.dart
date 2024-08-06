import 'package:dio/dio.dart';
import 'package:wallet/data/models/category_model/categories_model.dart';
import 'package:wallet/data/responses/my_response.dart';
import 'package:wallet/services/secure_api_service/secure_api_client.dart';
import 'package:wallet/data/local/storage_repository.dart'; // Tokenni olish uchun

class SecureApiService extends SecureApiClient {
  Future<MyResponse> addCategory({required String categoryName}) async {
    MyResponse myResponse = MyResponse(errorMessage: "");
    try {
      String? token = await StorageRepository.getString("token");
      if (token == null) {
        myResponse.errorMessage = "No token found";
        return myResponse;
      }

      final Response response = await dio.post(
        '${dio.options.baseUrl}/api/categories',
        data: {"name": categoryName},
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        // Assuming the API returns a message or data on successful creation
        myResponse.data = response.data;
      } else {
        myResponse.errorMessage = "Error: ${response.statusCode} - ${response.statusMessage}";
      }
    } catch (error) {
      myResponse.errorMessage = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getCategory() async {
    MyResponse myResponse = MyResponse(errorMessage: "");

    try {
      String? token = await StorageRepository.getString("token");

      if (token == null) {
        myResponse.errorMessage = "No token found";
        return myResponse;
      }

      final Response response = await dio.get(
        '${dio.options.baseUrl}/api/categories',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data != null) {
          myResponse.data = CategoriesModel.fromJson(response.data as Map<String, dynamic>);
        } else {
          myResponse.errorMessage = "No data found";
        }
      } else {
        myResponse.errorMessage = "Error: ${response.statusCode} - ${response.statusMessage}";
      }
    } catch (error) {
      myResponse.errorMessage = error.toString();
    }

    return myResponse;
  }
}
