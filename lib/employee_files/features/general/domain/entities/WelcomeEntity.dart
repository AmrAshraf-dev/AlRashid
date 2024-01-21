

import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';

class WelcomeEntity {
  String? image;
  String? desc;
  String? title;
  bool last;
  int? index;
  GenericBloc<int>? pageCubit;

  WelcomeEntity({
    this.image,
    this.title,
    this.desc,
    this.last = false,
    this.index,
    this.pageCubit,
  });
}
