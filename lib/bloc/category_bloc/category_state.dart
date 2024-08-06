part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormsStatus status;
  final String categoryName;
  final List<CategoryModel> categoriesModel;

  const CategoryState({
    required this.status,
    required this.errorMessage,
    required this.statusMessage,
    required this.categoryName,
    required this.categoriesModel,
  });

  CategoryState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormsStatus? status,
    String? categoryName,
    List<CategoryModel>? categoriesModel,
  }) {
    return CategoryState(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      categoryName: categoryName ?? this.categoryName,
      categoriesModel: categoriesModel ?? this.categoriesModel,
    );
  }

  @override
  List<Object?> get props => [
    status,
    statusMessage,
    errorMessage,
    categoryName,
    categoriesModel,
  ];
}
