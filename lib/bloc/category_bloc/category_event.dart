part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class AddCategoryEvent extends CategoryEvent {
  final String categoryName;

  const AddCategoryEvent(
      {required this.categoryName});

  @override
  List<Object?> get props => [categoryName];
}
class GetCategoryEvent extends CategoryEvent {

  @override
  List<Object?> get props => [];
}