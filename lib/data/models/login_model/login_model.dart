import 'package:wallet/data/models/category_model/categories_model.dart';

class LoginModel {
  final bool status;
  final String message;
  final String token;

  LoginModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      token: json['token'],
    );
  }

  static CategoriesModel initialValue() =>
      CategoriesModel(categories: [], status: false);
}
