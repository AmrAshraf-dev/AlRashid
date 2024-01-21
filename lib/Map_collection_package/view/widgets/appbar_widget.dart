import 'package:alrashid_mall_app/Map_collection_package/view/shared/global.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //var locale = AppLocalizations.of(context);
    return AppBar(
      elevation: 0.0,
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Column(
          children: [
            // GestureDetector(
            //   /// GHAYR EL LINE NAME HNAAAAAAAAAAAAAAAA
            //   onTap: () async {
            //     lineSecondFloor = await PositionsController.addLineFunc(
            //       context,
            //       isIntersection: 1,
            //       name: '',
            //       floor: 3,
            //     );
            //   },
            //   child: Container(
            //     width: 120,
            //     height: 45,
            //     child: Center(
            //       child: Text(
            //         /// GHAYR EL LINE NAME HNAAAA brdooooooooooooooo
            //         'add line' + "${lineSecondFloor?.id}",
            //         style: const TextStyle(
            //           color: Color(0xffb83f48),
            //           fontFamily: ('DINNextLTArabic'),
            //           fontSize: 18.0,
            //         ),
            //       ),
            //     ),
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: const Color(0xffb83f48),
            //       ),
            //       borderRadius: BorderRadius.circular(22),
            //     ),
            //   ),
            // ),
            Text(
              tr('move map'), //locale!.moveMap!,
              style: const TextStyle(
                color: Global.blue,
                fontWeight: FontWeight.w900,
                fontFamily: ('DINNextLTArabic'),
                fontSize: 12.0,
              ),
            ),
            Text(
              tr('Floor Plan Screen'), //locale.floorPlanScreen!,
              style: const TextStyle(
                color: Global.blue,
                fontWeight: FontWeight.w900,
                fontFamily: ('DINNextLTArabic'),
                fontSize: 16.0,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Global.blue,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
