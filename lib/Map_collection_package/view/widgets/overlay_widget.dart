import 'package:alrashid_mall_app/Map_collection_package/view/shared/global.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:flutter/material.dart';

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({Key? key}) : super(key: key);

  /// Start by dragging with your fingers
  @override
  Widget build(BuildContext context) {
    //var locale = AppLocalizations.of(context);
    return IgnorePointer(
      ignoring: true,
      child: Container(
        color: Global.blue.withOpacity(0.85),
        child: Center(
          child: SingleChildScrollView(
            /// changed some hereeeeeeeeeeeeeeeeeeeeeee on SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.touch_app,
                  color: Colors.white,
                  size: 40.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  tr('Start by dragging with your fingers'), //locale!.draggingFingers!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: ('DINNextLTArabic'),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
