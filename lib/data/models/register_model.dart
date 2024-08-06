import 'dart:convert';

class RegisterModel {
  final String name;
  final String surname;
  final String username;
  final String password;

  RegisterModel({
    required this.name,
    required this.surname,
    required this.username,
    required this.password,
  });
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      surname: json['surname'],
      username: json['username'],
      password: json['password'],
    );
  }

  // Convert a RegisterModel instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'username': username,
      'password': password,
    };
  }
}

