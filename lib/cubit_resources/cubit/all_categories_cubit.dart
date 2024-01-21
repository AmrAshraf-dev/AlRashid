import 'package:alrashid_mall_app/api/controllers/all_Categories_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/all_categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit() : super(AllCategoriesInitial());
  static AllCategoriesCubit get(context) => BlocProvider.of(context);

  bool loading = true;
  bool err = false;
  String token = '0';
  bool evetnsData = false;
  bool categoriesDataErr = false;

  Future<void> fetchAllCategoriesData(
      BuildContext context, String token, {String? tradeMarkId}) async {
    loading = true;
    err = false;
    emit(AllCategoriesGettingLoading());
    final bool allCategories =
        await AllCategoriesController.getAllCategoriesData(context, token);
    if (allCategories) {
      loading = false;
      err = false;
      emit(AllCategoriesFetchingOk(
          allCategoriesModel: AllCategoriesController.allCategoriesModel));
    } else {
      loading = false;
      err = true;
      emit(AllCategoriesFetchingErr());
    }
  }
}
