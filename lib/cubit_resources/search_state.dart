import 'package:alrashid_mall_app/models/search_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchGettingLoading extends SearchState {}

class SearchFetchingOk extends SearchState {
  final SearchModel searchModel;
  const SearchFetchingOk({required this.searchModel});
  @override
  List<Object> get props => [searchModel];
}

class SearchFetchingErr extends SearchState {}
