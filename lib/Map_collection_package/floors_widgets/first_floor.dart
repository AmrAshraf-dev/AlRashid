import 'package:alrashid_mall_app/Map_collection_package/core/viewmodels/floorplan_models.dart';
import 'package:alrashid_mall_app/Map_collection_package/positions_data_controller.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/appbar_widget.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/firstfloor_ui.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/overlay_widget.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/raw_gesture_detector_widget.dart';
import 'package:alrashid_mall_app/Map_collection_package/view/widgets/reset_button_widget.dart';
import 'package:alrashid_mall_app/Views/UI/Indoor_maps/from_to_first.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/lines_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/positions_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/positions_state.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/routes_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class FirstFloor extends StatefulWidget {
  final int? fromId;
  final int? toId;
  final int? floor;
  final bool? showRoute;
  const FirstFloor(
      {Key? key, this.fromId, this.toId, this.floor, this.showRoute = false})
      : super(key: key);

  @override
  State<FirstFloor> createState() => _FirstFloorState();
}

class _FirstFloorState extends State<FirstFloor> {
  late final PoistionsCubit _blocPositions;
  late final RoutesCubit _blocRoutes;
  late final LinesCubit _blocLines;

  @override
  void initState() {
    print('shooooow rooooute : ${widget.showRoute}');
    _blocPositions = BlocProvider.of<PoistionsCubit>(context);
    _blocRoutes = BlocProvider.of<RoutesCubit>(context);
    _blocLines = BlocProvider.of<LinesCubit>(context);

    setState(() {
      _blocRoutes.emptyRoutes();
      PositionsController.routePositionModel = [];
      //PositionsController.shopPostionModel = [];
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await _blocPositions.fetchAllPositionsData(context, 2);

      // whenComplete(() {
      //   setState(() {});
      // });
      // _blocRoutes.fetchAllRoutesData(
      //     context, widget.fromId ?? 0, widget.toId ?? 0, widget.floor ?? 0);
      if (widget.showRoute == true) {
        await _blocRoutes.fetchAllRoutesData(
            context, widget.fromId ?? 0, widget.toId ?? 0, widget.floor ?? 0);
        //     .whenComplete(() {
        //   setState(() {});
        // });
      }
      _blocLines.fetchAllLinesData(context);
      shopPointersLocationsFirst = PositionsController.shopPostionModel;
      routePositionsFirst = PositionsController.routePositionModel;
      linesFirst = PositionsController.lines;
      lineFirst = PositionsController.line;
      print("shop pointers loc");
      // print(shopPointersLocations);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FloorPlanModel>(context);

    //var locale = AppLocalizations.of(context);
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
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => FromToFirst()));
          },
          child: Container(
            //color: const Color(0xffb83f48), //Global.blue,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  BlocBuilder<PoistionsCubit, PositionsState>(
                    builder: (context, state) {
                      return _blocPositions.loading
                          ? ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (c, i) => const ShimmerWidget(),
                              itemCount: 2,
                              //  PositionsController.shopPostionModel.length,
                              separatorBuilder: (c, i) => const SizedBox(
                                height: 10,
                              ),
                            )
                          : _blocPositions.err
                              ? Center(
                                  child: Text(
                                    tr('Error'), // locale!.error ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: ('DINNextLTArabic'),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: null,
                                  ),
                                )
                              : const RawGestureDetectorWidget(
                                  child: FirstUI(),
                                );
                    },
                  ),

                  //const TestUI(),

                  model.hasTouched
                      ? const ResetButtonWidget()
                      : const OverlayWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
