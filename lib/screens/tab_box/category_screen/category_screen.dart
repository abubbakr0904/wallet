import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/bloc/category_bloc/category_bloc.dart';
import 'package:wallet/data/models/category_model/category_model.dart';
import 'package:wallet/data/models/enums/forms_status.dart';
import 'package:wallet/screens/tab_box/category_screen/widget/bottom_sheet.dart';
import 'package:wallet/screens/tab_box/category_screen/widget/dialog.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController newCategory = TextEditingController();

  init() {
    BlocProvider.of<CategoryBloc>(context).add(
        GetCategoryEvent()
    );
  }


  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category screen",
          style: AppTextStyle.montserratBlack
              .copyWith(color: AppColors.appMainColor, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              getBottomSheet(context, newCategory, "Category");
            },
            icon: const Icon(
              Icons.add_circle,
              color: AppColors.appMainColor,
              size: 30,
            ),
          )
        ],
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if(state.status == FormsStatus.getCategorySuccess){
            return ListView(
              children: [
                ...List.generate(
                  state.categoriesModel.length,
                      (index) {
                    CategoryModel categoryModel = state.categoriesModel[index];
                    return GestureDetector(
                      onLongPress: () {
                        getDialog(context);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: AppColors.appMainColor, width: 2),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              )),
                          child: Text(
                            categoryModel.name,
                            style: AppTextStyle.montserratSemiBold
                                .copyWith(color: Colors.black, fontSize: 20),
                          )),
                    );
                  },
                )
              ],
            );
          }
          if(state.status == FormsStatus.getCategoryLoading){
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.appMainColor,
              ),
            );
          }
          else{
            return Center(
              child: Text("We have error" , style: AppTextStyle.montserratBlack.copyWith(
                color : Colors.red,
                fontSize: 30
              ),)
            );
          }
        },
      ),
    );
  }
}
