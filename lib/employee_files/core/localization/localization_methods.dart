
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_context.dart';

import 'set_localization.dart';


String tr(String key) {
  return SetLocalization.of(getIt<GlobalContext>().context())!.getTranslateValue(key);
}
