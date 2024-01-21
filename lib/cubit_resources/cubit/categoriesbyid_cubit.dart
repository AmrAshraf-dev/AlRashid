import 'package:alrashid_mall_app/cubit_resources/cubit/categoriesbyid_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/controllers/all_Categories_Controller.dart';

class CategoriesByIdCubit extends Cubit<CategoriesByIdState> {
  CategoriesByIdCubit() : super(CategoriesByIdInitial());
  bool loading = true;
  bool err = false;
  String token = '0';
  bool categoriesData = false;
  bool categoriesDataErr = false;
  static CategoriesByIdCubit get(context) => BlocProvider.of(context);

  Future<void> fetchEventsDataById(BuildContext context, String token,
      {required String eventId}) async {
    loading = true;
    err = false;
    emit(CategoriesByIdGettingLoading());

    final bool categoriesById = await AllCategoriesController.getCategoriesById(
        context, token, eventId);
    if (categoriesById) {
      loading = false;
      err = false;
      emit(CategoriesByIdFetchingOk(
          categoriesByIdModel: AllCategoriesController.categoriesByIdModel));
    } else {
      loading = false;
      err = true;
      emit(CategoriesByIdFetchingErr());
    }
  }
}
