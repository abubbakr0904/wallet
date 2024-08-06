import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/data/models/category_model/category_model.dart';
import 'package:wallet/data/models/enums/forms_status.dart';
import 'package:wallet/data/repositories/category_repository.dart';
import 'package:wallet/data/responses/my_response.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository})
      : super(
          const CategoryState(
            status: FormsStatus.pure,
            errorMessage: "",
            statusMessage: "",
            categoryName: "",
            categoriesModel:[],
          ),
        ) {
    on<AddCategoryEvent>(_insertCategory);
    on<GetCategoryEvent>(_getCategory);
  }

  Future<void> _insertCategory(
      AddCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: FormsStatus.createCategoryLoading));
    MyResponse myResponse = await categoryRepository.insertCategory(
        categoryName: event.categoryName);
    if (myResponse.errorMessage.isEmpty) {
      emit(
        state.copyWith(
          status: FormsStatus.createCategorySuccess,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.createCategoryFailure,
          errorMessage: myResponse.errorMessage.toString(),
        ),
      );
    }
  }

  Future<void> _getCategory(
      GetCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(status: FormsStatus.getCategoryLoading));
    MyResponse myResponse = await categoryRepository.getCategory();
    if (myResponse.errorMessage.isEmpty) {
      debugPrint("welcome");
      emit(
        state.copyWith(
          status: FormsStatus.getCategorySuccess,
          categoriesModel: myResponse.data.categories
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.getCategoryFailure,
          errorMessage: myResponse.errorMessage.toString(),
        ),
      );
    }
  }
}
