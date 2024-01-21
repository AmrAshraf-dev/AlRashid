part of 'orders_imports.dart';

class OrderData {
  GenericBloc<List<OrderModel>> orderCubit = GenericBloc([]);
  final GlobalKey<CustomButtonState> removeBtnKey = GlobalKey();
  final GlobalKey<CustomButtonState> acceptBtnKey = GlobalKey();



}
