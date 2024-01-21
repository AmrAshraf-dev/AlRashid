import 'package:alrashid_mall_app/api/controllers/search_controller.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  String? keyWord;
  bool loading = true;
  bool err = false;
  Future<void> doSearch(BuildContext context, String token,
      {required keyWord, dynamic searchID}) async {
    loading = true;
    err = false;
    emit(SearchGettingLoading());
    final bool search = await MySearchController.searchFunc(context, token,
        keyWord: keyWord, serviceId: searchID);
    if (search) {
      loading = false;
      err = false;
      emit(SearchFetchingOk(searchModel: MySearchController.searchModel));
    } else {
      loading = false;
      err = true;
      emit(SearchFetchingErr());
    }
  }
}
