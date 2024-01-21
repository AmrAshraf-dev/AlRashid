import 'package:alrashid_mall_app/Map_collection_package/core/viewmodels/floorplan_models.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/shared/global.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/appbar_widget.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/gridview_widget.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/overlay_widget.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/raw_gesture_detector_widget.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/reset_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FloorPlanScreen extends StatelessWidget {
  const FloorPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FloorPlanModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBarWidget(),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: Container(
          color: Global.blue, //Color(0xffb83f48),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const RawGestureDetectorWidget(
                  child: GridViewWidget(),
                ),
                model.hasTouched
                    ? const ResetButtonWidget()
                    : const OverlayWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
