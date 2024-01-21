import 'dart:collection';
import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/blaza_floor.dart';
import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/first_floor.dart';
import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/ground_floor.dart';
import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/second_floor.dart';
import 'package:alrashid_mall_app/Map_collection_package/floors_widgets/third_floor.dart';
import 'package:alrashid_mall_app/Map_collection_package/positions_data_controller.dart';
import 'package:alrashid_mall_app/api/controllers/stroes_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/positions_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/routes_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/Stores_model.dart';
import 'package:alrashid_mall_app/models/shop_position.dart';
import 'package:alrashid_mall_app/utils/textfield_search_label.dart';
import 'package:alrashid_mall_app/widgets/shops_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:textfield_search/textfield_search.dart';

// ignore: must_be_immutable
class FromToSecond extends StatefulWidget {
  String? token;
  FromToSecond({
    Key? key,
    this.token,
  }) : super(key: key);

  @override
  State<FromToSecond> createState() => _FromToSecondState();
}

class _FromToSecondState extends State<FromToSecond> {
  final fieldTextTo = TextEditingController();
  final fieldTextFrom = TextEditingController();
  List<StoresModel> stores = [];
  List<StoresModel> filteredStores = [];
  List<ShopPositionModel> shopPositionModel = [];
  StoresController storesController = StoresController();
  List<StoresPlacesModel>? storesPlacesModel;
  int? fromId;
  int? toID;
  int? floor = 3;
  // final _debouncer = Debouncer(milliseconds: 500);
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    // fieldTextTo.dispose();
    //fieldTextFrom.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    // fieldTextFrom.addListener(_printLatestValue);
    //fieldTextTo.addListener(_printLatestValue);
    final RoutesCubit _blocRoutes = BlocProvider.of<RoutesCubit>(context);
    //_blocRoutes.fetchAllRoutesData(context);
  }

  _printLatestValue() {
    print("Textfield value: ${fieldTextFrom.text + fieldTextFrom.text}");
  }

  dynamic myIndex;
  String pageToGoBackTo = "";
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    // final StoresCubit _blocStores = BlocProvider.of<StoresCubit>(context);
    final PoistionsCubit _blocPositions =
        BlocProvider.of<PoistionsCubit>(context);
    final RoutesCubit _blocRoutes = BlocProvider.of<RoutesCubit>(context);
    Future<List> getData() async {
      // await _blocStores.fetchAllStoresData(context, widget.token ?? '');
      await _blocPositions.fetchAllPositionsData(context, floor ?? 0);

      // List<StoresPlacesModel> places =
      //     StoresController.storesModel.storesPlacesModel!;
      List<ShopPositionModel> positions = PositionsController.shopPostionModel;

      // List placeNames = [];
      List positionsCodes = [];
      for (var i = 0; i < positions.length; i++) {
        positionsCodes.add(PlaceItem(
            label: positions.elementAt(i).name!,
            value: positions.elementAt(i).id!));
      }
      return positionsCodes;
    }

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _blocPositions.fetchAllPositionsData(context, floor ?? 0);
      // _blocRoutes.fetchAllRoutesData(context);
    });
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    final Queue<BuildContext> _queue = Queue();

    return Scaffold(
      body: Directionality(
        textDirection: lang == 'ar' //locale!.locale.languageCode == 'en'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: const BoxDecoration(
                          // ignore: use_full_hex_values_for_flutter_colors
                          color: Color(0xff2eb83f48),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: mywidth * 0.02),
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ///ARABIC NAME
            //locale.locale.languageCode == 'en'
            //  ?
            ///FROM
            // Padding(
            //   padding: const EdgeInsets.all(8.0),

            //   child: TextFormField(
            //     readOnly: true,
            //     controller: fieldTextFrom,
            //     style: const TextStyle(
            //       height: 0.9,
            //       fontFamily: ('DINNextLTArabic'),
            //     ),
            //     decoration: InputDecoration(
            //       suffixIcon: IconButton(
            //         onPressed: () => fieldTextFrom.clear(),
            //         icon: const Icon(Icons.clear),
            //         color: const Color(0xff333333),
            //       ),
            //       hintText: 'الدخول',
            //       hintStyle: const TextStyle(
            //         color: Color(0xffa6a6a6),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //           borderSide: const BorderSide(
            //               color: Color(0xfff2f2f2), width: 32.0),
            //           borderRadius: BorderRadius.circular(25.0)),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide:
            //             const BorderSide(color: Color(0xfff2f2f2), width: 32.0),
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //     ),
            //   ),
            // ),

            ///FROM
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldSearch(
                controller: fieldTextFrom,
                label: tr('from'),
                future: () {
                  return getData();
                },
                getSelectedValue: (value) async {
                  fromId = value.value;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => fieldTextTo.clear(),
                    icon: const Icon(Icons.clear),
                    color: const Color(0xff333333),
                  ),
                  hintText: tr('from'),
                  hintStyle: const TextStyle(
                    color: Color(0xffa6a6a6),
                  ),
                  enabledBorder: OutlineInputBorder(
                      // borderSide: const BorderSide(
                      //     color: Color(0xfff2f2f2), width: 32.0),
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xfff2f2f2), width: 32.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  fillColor: const Color(0xfff2f2f2),
                  filled: true,
                ),
              ),
            ),

            /// TO
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldSearch(
                controller: fieldTextTo,
                // style: const TextStyle(
                //   height: 0.9,
                //   fontFamily: ('DINNextLTArabic'),
                // ),
                label: tr('to'),
                future: () {
                  return getData();
                },
                getSelectedValue: (value) async {
                  toID = value.value;
                  if (fromId == null) {
                    EasyLoading.showToast(tr('fromtoGo').toString());
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SecondFloor(
                                  fromId: fromId,
                                  toId: toID,
                                  floor: floor,
                                  showRoute: true,
                                )));
                  }

                  // BlazaStoresCoordinates.currentCoordinates = [];
                  // setState(() {
                  //   for (var i = 0; i <= value.value * 2; i++) {
                  //     BlazaStoresCoordinates.currentCoordinates
                  //         // .add(BlazaStoresCoordinates.coordinates.elementAt(i));
                  //         .add(PositionsController.routePositionModel.elementAt(i));
                  //   }
                  // print("To Id before" + value.value);
                  // await PositionsController.getRoutesData(context,
                  //         fromId: 4, toId: value.value)
                  //     .whenComplete(() {
                  print("To Id....." + value.value.toString());
                  //  Navigator.of(context).pop;
                  // Navigator.of(context).popUntil(
                  //     (route) => route.settings.name == pageToGoBackTo);
                  //  setState(() {});

                  // Navigator.pop(context, true);

                  // onTapFunc(myIndex, context);
                  // print('myIndex : $myIndex');

                  // Navigator.of(context).popUntil(
                  //     (route) => route.settings.name == pageToGoBackTo);

                  //  WillPopScope(
                  //   child: Container(),
                  //   onWillPop: () async {
                  //     if (_queue.isNotEmpty) {
                  //       Navigator.of(_queue.removeLast()).pop();
                  //       return false;
                  //     }
                  //     return true;
                  //   },
                  // );
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             const BlazaFloor()));
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const BlazaFloor()), // this mymainpage is your page to refresh
                  //     (Route<dynamic> route) => false);
                  // });
                  //}
                  //  );
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => fieldTextTo.clear(),
                    icon: const Icon(Icons.clear),
                    color: const Color(0xff333333),
                  ),
                  hintText: tr('to'),
                  hintStyle: const TextStyle(
                    color: Color(0xffa6a6a6),
                  ),
                  enabledBorder: OutlineInputBorder(
                      // borderSide: const BorderSide(
                      //     color: Color(0xfff2f2f2), width: 32.0),
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xfff2f2f2), width: 32.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  fillColor: const Color(0xfff2f2f2),
                  filled: true,
                ),
              ),
            ),

            ///Shops result view
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(), //
                padding: const EdgeInsets.symmetric(vertical: 0),
                itemCount: shopPositionModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ShopsList(
                    name: shopPositionModel[index].name,
                    floorNumber: shopPositionModel[index].floor.toString(),
                  );
                }),

            // BlocBuilder<StoresCubit, StoresState>(
            //   builder: (context, state) {
            //     return _blocStores.loading
            //         ? Padding(
            //             padding: EdgeInsets.only(top: myheight * 0.25),
            //             child: const CircularProgressIndicator(
            //               color: Color(0xffb83f48),
            //             ),
            //           )
            //         : _blocStores.err
            //             ? Center(
            //                 child: Text(
            //                   locale.error!,
            //                   style: const TextStyle(
            //                     color: Colors.white,
            //                     fontFamily: ('DINNextLTArabic'),
            //                     fontSize: 16.0,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                   maxLines: null,
            //                 ),
            //               )
            //             : Expanded(
            //                 child: ListView.builder(
            //                     shrinkWrap: true,
            //                     scrollDirection: Axis.vertical,
            //                     physics:
            //                         const AlwaysScrollableScrollPhysics(), // new
            //                     itemCount: StoresController
            //                         .storesModel.storesPlacesModel!.length,
            //                     itemBuilder: (BuildContext context, int index) {
            //                       return Directionality(
            //                         textDirection:
            //                             locale.locale.languageCode == 'en'
            //                                 ? TextDirection.rtl
            //                                 : TextDirection.ltr,
            //                         child: StoresList(
            //                           image: StoresController.storesModel
            //                               .storesPlacesModel![index].image,
            //                           name: locale.locale.languageCode == 'en'
            //                               ? StoresController.storesModel
            //                                   .storesPlacesModel![index].nameAr
            //                               : StoresController.storesModel
            //                                   .storesPlacesModel![index].nameEn,
            //                           // locale.locale.languageCode == 'en'
            //                           //     ? filteredStores[index]
            //                           //         .storesPlacesModel![index]
            //                           //         .nameAr
            //                           //     : filteredStores[index]
            //                           //         .storesPlacesModel![index]
            //                           //         .nameEn,
            //                           floorNumber: StoresController
            //                               .storesModel
            //                               .storesPlacesModel![index]
            //                               .floorNumber,
            //                         ),
            //                       );
            //                     }),
            //               );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  onTapFunc(myIndex, BuildContext context) {
    switch (myIndex) {
      case 0:
        {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const BlazaFloor()));
        }
        break;
      case 1:
        {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const GroundFloor()));
        }
        break;
      case 2:
        {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const FirstFloor()));
        }
        break;
      case 3:
        {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const SecondFloor()));
        }
        break;
      case 4:
        {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ThirdFloor()));
        }
        break;
    }
  }
}
