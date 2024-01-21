import 'package:alrashid_mall_app/models/lines_model.dart';
import 'package:alrashid_mall_app/models/shop_position.dart';
import 'package:equatable/equatable.dart';

abstract class LinesState extends Equatable {
  const LinesState();

  @override
  List<Object> get props => [];
}

class LinesInitial extends LinesState {}

class LinesGettingLoading extends LinesState {}

class LinesFetchingOk extends LinesState {
  final List<LinesModel> linesModel;
  const LinesFetchingOk({required this.linesModel});
  @override
  List<Object> get props => [ShopPositionModel];
}

class LinesFetchingErr extends LinesState {}
