import 'package:wallet/data/models/category_model/category_model.dart';

class CategoriesModel {
  final bool status;
  final List<CategoryModel> categories;

  CategoriesModel({required this.status, required this.categories});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'] as bool,
      categories: (json['categories'] as List<dynamic>)
          .map((categoryJson) => CategoryModel.fromJson(categoryJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'categories': categories.map((category) => category.toJson()).toList(),
    };
  }


  static CategoriesModel initialValue() => CategoriesModel(
    categories: [],
    status: false
  );
}
