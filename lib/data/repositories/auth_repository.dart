import 'package:wallet/data/responses/my_response.dart';
import 'package:wallet/services/open_api_service/open_api_service.dart';
import 'package:wallet/utils/service_locator.dart';

class LoginRepository {
  Future<MyResponse> walletLogin(
          {required String username, required String password}) =>
      serviceLocator
          .get<OpenApiService>()
          .walletLogin(username: username, password: password);

  Future<MyResponse> walletRegister(
          {required String username,
          required String password,
          required String surname,
          required String name}) =>
      serviceLocator.get<OpenApiService>().walletRegister(
          username: username, password: password, name: name, surname: surname);
}
