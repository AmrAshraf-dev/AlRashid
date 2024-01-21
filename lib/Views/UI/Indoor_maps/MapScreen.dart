import 'dart:collection';

import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:flutter/material.dart';

import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/blaza_floor.dart';
import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/first_floor.dart';
import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/ground_floor.dart';
import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/second_floor.dart';
import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/third_floor.dart';
import 'package:alrashid_mall_app/Views/UI/BottomNavyBar.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapScreen extends StatefulWidget {
  final bool showRoute;
  final int? fromId;
  final int? toId;
  final int? floor;
  const MapScreen({
    Key? key,
    this.showRoute = false,
    this.fromId,
    this.toId,
    this.floor,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  // Animation controller
  AnimationController? _animationController;

  // This is used to animate the icon of the main FAB
  Animation<double>? _buttonAnimatedIcon;

  // This is used for the child FABs
  Animation<double>? _translateButton;

  // This variable determnies whether the child FABs are visible or not
  bool _isExpanded = false;

  //final RoutesCubit _blocRoutes;
  @override
  initState() {
    // WidgetsBinding.instance?.addPostFrameCallback((_) async {
    //   if (widget.showRoute == true) {
    //     await _blocRoutes.fetchAllRoutesData(
    //         context, widget.fromId ?? 0, widget.toId ?? 0, widget.floor ?? 0);
    //     //     .whenComplete(() {
    //     //   setState(() {});
    //     // });
    //   }
    // });

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addListener(() {
        setState(() {});
      });

    _buttonAnimatedIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);

    _translateButton = Tween<double>(
      begin: 100,
      end: -20,
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  // dispose the animation controller
  @override
  dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  // This function is used to expand/collapse the children floating buttons
  // It will be called when the primary FAB (with menu icon) is pressed
  _toggle() {
    if (_isExpanded) {
      _animationController?.reverse();
    } else {
      _animationController?.forward();
    }

    _isExpanded = !_isExpanded;
  }

  BuildContext? _c1;

  final Queue<BuildContext> _queue = Queue();
  MyBottomNavyBar myBottomNavyBar = MyBottomNavyBar();

  int? floor;
  @override
  Widget build(BuildContext context) {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return WillPopScope(
      onWillPop: () async {
        if (_queue.isNotEmpty) {
          Navigator.of(_queue.removeLast()).pop();
          return false;
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) {
                      _c1 = context;
                      //return
                      // return GestureDetector(
                      //   onTap: () {
                      //     _queue.addLast(context);
                      //   },
                      // );
                      return BlazaFloor(
                        floor: floor,
                        showRoute: false,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform(
              transform: Matrix4.translationValues(
                0.0,
                _translateButton!.value * 5,
                0.0,
              ),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.black87,
                onPressed: () {
                  Navigator.of(_c1!).push(MaterialPageRoute(
                      builder: (context) => ThirdFloor(
                            floor: floor,
                          )));
                  _queue.addLast(_c1!);

                  //thirdFloor == 3;
                },

                heroTag: 'thirdfloor',
                label: Row(
                  children: [
                    Text(
                      tr('thirdFloor'), //  locale!.thirdFloor!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'assets/icons/layers.png',
                      width: 35.0,
                      height: 20.0,
                    ),
                  ],
                ),
                // backgroundColor: Colors.blue,
                // onPressed: () {/* Do something */},
                // child:
                //     //Icon(Icons.email,),
                //     Image.asset(
                //   'assets/icons/layers.png',
                //   width: 40.0,
                //   height: 20.0,
                // ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                0,
                _translateButton!.value * 4,
                0,
              ),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.black87,
                onPressed: () {
                  //secondFloor

                  Navigator.of(_c1!).push(MaterialPageRoute(
                      builder: (context) => SecondFloor(
                            floor: floor,
                            showRoute: false,
                          )));
                  _queue.addLast(_c1!);
                },
                heroTag: 'secondfloor',
                label: Row(
                  children: [
                    Text(
                      tr('secondFloor'), // locale.secondFloor!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'assets/icons/layers.png',
                      width: 35.0,
                      height: 20.0,
                    ),
                  ],
                ),
                // backgroundColor: Colors.red,
                // onPressed: () {/* Do something */},
                // child: Image.asset(
                //   'assets/icons/layers.png',
                //   width: 40.0,
                //   height: 20.0,
                // ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                0,
                _translateButton!.value * 3,
                0,
              ),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.black87,
                onPressed: () {
                  // firstFloor

                  Navigator.of(_c1!).push(MaterialPageRoute(
                      builder: (context) => FirstFloor(
                            floor: floor,
                            showRoute: false,
                          )));
                  _queue.addLast(_c1!);
                },
                heroTag: 'firstfloor',
                label: Row(
                  children: [
                    Text(
                      tr('firstFloor'), //locale.firstFloor!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'assets/icons/layers.png',
                      width: 35.0,
                      height: 20.0,
                    ),
                  ],
                ),
                // backgroundColor: Colors.amber,
                // onPressed: () {/* Do something */},
                // child: Image.asset(
                //   'assets/icons/layers.png',
                //   width: 40.0,
                //   height: 20.0,
                // ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                0,
                _translateButton!.value * 2,
                0,
              ),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.black87,
                onPressed: () {
                  // ground

                  Navigator.of(_c1!).push(MaterialPageRoute(
                      builder: (context) => GroundFloor(
                            floor: floor,
                            showRoute: false,
                          )));
                  _queue.addLast(_c1!);
                },
                heroTag: 'groundfloor',
                label: Row(
                  children: [
                    Text(
                      tr('groundFloor'), //locale.groundFloor!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'assets/icons/layers.png',
                      width: 35.0,
                      height: 20.0,
                    ),
                  ],
                ),

                // backgroundColor: Colors.amber,
                // onPressed: () {/* Do something */},
                // child: Image.asset(
                //   'assets/icons/layers.png',
                //   width: 40.0,
                //   height: 20.0,
                // ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                0,
                _translateButton!.value * 1,
                0,
              ),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.black87,
                onPressed: () {
                  // ground

                  Navigator.of(_c1!).push(MaterialPageRoute(
                      builder: (context) => BlazaFloor(
                            floor: floor,
                            showRoute: false,
                          )));
                  _queue.addLast(_c1!);
                },
                heroTag: 'Blaza floor',
                label: Row(
                  children: [
                    Text(
                      tr('blazaFloor'), //locale.blazaFloor!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'assets/icons/layers.png',
                      width: 35.0,
                      height: 20.0,
                    ),
                  ],
                ),

                // backgroundColor: Colors.amber,
                // onPressed: () {/* Do something */},
                // child: Image.asset(
                //   'assets/icons/layers.png',
                //   width: 40.0,
                //   height: 20.0,
                // ),
              ),
            ),
            myBottomNavyBar.currentIndex != 2
                ? FloatingActionButton(
                    onPressed: () {
                      _toggle();
                    },
                    backgroundColor: Colors.black87,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _buttonAnimatedIcon!,
                    ),
                  )
                : Container()
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
