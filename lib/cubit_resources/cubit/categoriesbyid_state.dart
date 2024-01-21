import 'package:alrashid_mall_app/models/all_categories_model.dart';
import 'package:equatable/equatable.dart';

abstract class CategoriesByIdState extends Equatable {
  const CategoriesByIdState();

  @override
  List<Object> get props => [];
}

class CategoriesByIdInitial extends CategoriesByIdState {}

class CategoriesByIdGettingLoading extends CategoriesByIdState {}

class CategoriesByIdFetchingOk extends CategoriesByIdState {
  final CategoriesByIdModel categoriesByIdModel;
  const CategoriesByIdFetchingOk({
    required this.categoriesByIdModel,
  });
  @override
  List<Object> get props => [CategoriesByIdModel];
}

class CategoriesByIdFetchingErr extends CategoriesByIdState {}
