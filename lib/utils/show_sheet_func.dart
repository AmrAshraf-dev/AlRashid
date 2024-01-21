import 'package:flutter/material.dart';

showSheet(BuildContext context, Widget widget,
    {bool isDismissible = true, bool? builderContext}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible,
      builder: (context) => widget);
}
