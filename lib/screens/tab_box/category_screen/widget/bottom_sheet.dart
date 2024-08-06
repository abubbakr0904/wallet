import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/bloc/category_bloc/category_bloc.dart';
import 'package:wallet/data/models/category_model/categories_model.dart';
import 'package:wallet/data/models/enums/forms_status.dart';
import 'package:wallet/screens/auth/widget/text_field_item.dart';
import 'package:wallet/screens/widget/global_button.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

getBottomSheet(BuildContext context, TextEditingController controller,
    String text) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max, // Change to min
          children: [
            Text(
              "New category",
              style: AppTextStyle.montserratBlack
                  .copyWith(color: AppColors.appMainColor, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldItem(controller: controller, hintText: text),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if(state.status == FormsStatus.createCategorySuccess){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.appMainColor,
                      content: Text('Add successfully' , style: AppTextStyle.montserratBlack.copyWith(
                          color : Colors.white
                      ),),
                    ),
                  );
                  Navigator.pop(context);
                }
                if(state.status == FormsStatus.createCategoryFailure){
                  print("${state.errorMessage}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Not added' , style: AppTextStyle.montserratBlack.copyWith(
                          color : Colors.white
                      ),),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if(state.status == FormsStatus.pure){
                  return GlobalButton(
                    text: "Saves",
                    onTap: () {
                      if(controller.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Name is empty' , style: AppTextStyle.montserratBlack.copyWith(
                                color : Colors.white
                            ),),
                          ),
                        );
                      }
                      else{
                        context.read<CategoryBloc>().add(
                            AddCategoryEvent(categoryName: controller.text)
                        );
                      }
                    },
                  );
                }
                if(state.status == FormsStatus.createCategoryLoading){
                  return GlobalButton(
                    text: "Loading...",
                    onTap: () {
                    },
                  );
                }
                return GlobalButton(
                  text: "Save",
                  onTap: () {
                    if(controller.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Name is empty' , style: AppTextStyle.montserratBlack.copyWith(
                              color : Colors.white
                          ),),
                        ),
                      );
                    }
                    else{
                      context.read<CategoryBloc>().add(
                          AddCategoryEvent(categoryName: controller.text)
                      );
                    }
                  },
                );

              },
            )
          ],
        ),
      );
    },
  );
}
