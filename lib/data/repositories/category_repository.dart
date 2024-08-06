import 'package:wallet/data/models/category_model/categories_model.dart';
import 'package:wallet/data/responses/my_response.dart';
import 'package:wallet/services/secure_api_service/secure_api_service.dart';
import 'package:wallet/utils/service_locator.dart';

class CategoryRepository {
  Future<MyResponse> insertCategory(
      {required String categoryName}) =>
      serviceLocator
          .get<SecureApiService>()
          .addCategory(categoryName: categoryName);

  Future<MyResponse> getCategory() =>
      serviceLocator
          .get<SecureApiService>()
          .getCategory();
}
