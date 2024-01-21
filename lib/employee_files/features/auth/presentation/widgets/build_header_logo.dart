import 'package:alrashid_mall_app/employee_files/res.dart';
import 'package:flutter/material.dart';

class BuildHeaderLogo extends StatelessWidget {
  const BuildHeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 50),
      child: Image(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.55,
        image: const AssetImage(Res.logoRashid),
        fit: BoxFit.contain,
      ),
    );
  }
}
