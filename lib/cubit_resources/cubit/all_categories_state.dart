import 'package:alrashid_mall_app/models/all_categories_model.dart';
import 'package:equatable/equatable.dart';

abstract class AllCategoriesState extends Equatable {
  const AllCategoriesState();

  @override
  List<Object> get props => [];
}

class AllCategoriesInitial extends AllCategoriesState {}

class AllCategoriesGettingLoading extends AllCategoriesState {}

class AllCategoriesFetchingOk extends AllCategoriesState {
  final AllCategoriesModel allCategoriesModel;
  const AllCategoriesFetchingOk({
    required this.allCategoriesModel,
  });
  @override
  List<Object> get props => [allCategoriesModel];
}

class AllCategoriesFetchingErr extends AllCategoriesState {}
