import 'package:alrashid_mall_app/employee_files/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:tf_custom_widgets/widgets/MyText.dart';

class BuildHeaderTitle extends StatelessWidget {
  final String title;

  const BuildHeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MyText(
        title: title,
        color: MyColors.black,
        size: 17,
        alien: TextAlign.center,

      ),
    );
  }
}
