import 'package:alrashid_mall_app/Map_collection_package/positions_data_controller.dart';
import 'package:alrashid_mall_app/models/lines_model.dart';
import 'package:alrashid_mall_app/models/route_position.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

import '../../../models/shop_position.dart';

class FirstUI extends StatefulWidget {
  const FirstUI({Key? key}) : super(key: key);

  @override
  State<FirstUI> createState() => _FirstUIState();
}

List<ShopPositionModel> shopPointersLocationsFirst = [];
List<RoutePositionModel> routePositionsFirst = [];
LinesModel? lineFirst;
List<LinesModel> linesFirst = [];
pointersOnImage(Size? size) {
  List<Widget> returnList = [
    Image.asset(
      'assets/images/first_floor-copy.jpg',
      //'assets/images/first_floor.png',

      fit: BoxFit.contain,
    ),
  ];

  for (var element in shopPointersLocationsFirst) {
    // double xratio = element.screenWidth! / size.width.toInt();
    // double yratio = element.screenHeight! / size.height.toInt();

    int screenWidthVar = element.screenWidth ?? 0;
    int screenHeightVar = element.screenHeight ?? 0;
    double xratio = size!.width.toInt() / screenWidthVar;
    double yratio = size.height.toInt() / screenHeightVar;
    returnList = returnList +
        [
          Positioned(
            left: element.x! * xratio + 0.0,
            top: element.y! * yratio + 0.0,
            child: element.name != '' && element.rotateAngle == 0
                ? Column(
                    children: [
                      // Image.asset(
                      //   'assets/images/bags.png',
                      //   width: 3,
                      //   height: 1.8,
                      // ),
                      CachedNetworkImage(
                        imageUrl:
                            // PositionsController
                            //     .shopPostionModel.first.image
                            //     .toString(),
                            element.image.toString(),
                        width: 1,
                        height: 1.5,
                      ),
                      SizedBox(
                        child: Column(
                          children: List.generate(
                              element.name?.split(" ").length ?? 0,
                              (index) => Text(
                                    element.name?.split(" ")[index] ?? '',
                                    style: TextStyle(
                                        fontSize:
                                            element.name!.split(" ").length > 2
                                                ? 0.7
                                                : 0.8,
                                        overflow: TextOverflow.visible),
                                  )),
                        ),
                      ),
                    ],
                  )
                : RotationTransition(
                    turns: AlwaysStoppedAnimation(element.rotateAngle / 100),
                    child: Column(
                      children: [
                        // Image.asset(
                        //   'assets/images/bags.png',
                        //   width: 3,
                        //   height: 1.8,
                        // ),
                        CachedNetworkImage(
                          imageUrl:
                              // PositionsController
                              //     .shopPostionModel.first.image
                              //     .toString(),
                              element.image.toString(),
                          width: 1,
                          height: 1.5,
                        ),
                        Text(
                          element.name ?? '',
                          style: TextStyle(
                              fontSize: element.name!.split(" ").length > 2
                                  ? 0.8
                                  : 0.85,
                              overflow: TextOverflow.visible),
                        ),
                      ],
                    ),
                  ),
          ),
        ];
    print('shop POINTERS LOCATIONS :: ==>> :$shopPointersLocationsFirst');
  }

  return returnList;
}

class _FirstUIState extends State<FirstUI> with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late Animation<double> animation;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // databaseInfo.getShopPositions(1);

    // databaseInfo.getShopPositions(0).then((value) => setState(() {
    //       shopPointersLocations = value;
    //     }));

    // databaseInfo.getRoutePosition(0).then((value) => setState(() {
    //       routePositions = value;
    //     }));
    // final PoistionsCubit _blocPositions =
    //     BlocProvider.of<PoistionsCubit>(context);
    // _blocPositions.fetchAllPositionsData(context);
    var controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    animation = Tween(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {
          _progress = animation.value;
        });
      });
    controller.forward();
    setState(() {
      routePositionsFirst = PositionsController.routePositionModel;
      shopPointersLocationsFirst = PositionsController.shopPostionModel;
      linesFirst = PositionsController.lines;
      lineFirst = PositionsController.line;
      print("shop pointers locs");
      print(shopPointersLocationsFirst);
      print("lines");
      print(lineFirst);
    });
  }

  //DatabaseInfoService databaseInfo = DatabaseInfoService();
  //final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MyPainter painter = MyPainter(routePositionsFirst);
    _onRouteSelect(TapUpDetails details) {
      var x = details.localPosition.dx.toInt();
      var y = details.localPosition.dy.toInt();
      Size size = currentSize;
      dynamic lineId = lineFirst?.id;

      setState(() {
        routePositionsFirst.add(RoutePositionModel(
            x: x,
            y: y,
            screenWidth: size.width.toInt(),
            screenHeight: size.height.toInt(),
            lineId: lineId));
        print('lines modell iddd : ${lineFirst?.id ?? 0}');
      });
      PositionsController.insertRoutesFunc(
        context,
        xpoint: x,
        ypoint: y,
        lineId: lineId,
        screenWidth: size.width.toInt(),
        screenHeight: size.height.toInt(),
      );
      //print('lines modell iddd2222 : ${lines.first.data?.first.id}');

      // databaseInfo
      //     .insertRoutePosition(RoutePositionModel(x: x, y: y, lineId: 0));
    }

    onTapDown(TapUpDetails details) {
      var x = details.localPosition.dx.toInt();
      var y = details.localPosition.dy.toInt();
      String? code = '';
      String? name = '';
      int? floor = 0;
      dynamic rotateAngle = 0;
      setState(() {
        shopPointersLocationsFirst.add(ShopPositionModel(
            x: x, y: y, name: '', code: '', floor: 0, rotateAngle: 0));
      });
      Future.delayed(
          const Duration(milliseconds: 200),
          () => EasyDialog(
                  closeButton: false,
                  height: MediaQuery.of(context).size.height * 0.8,
                  title: const Text('Add New Point'),
                  contentList: [
                    Builder(builder: (context) {
                      return FastForm(
                        formKey: formKey,
                        children: [
                          FastTextField(
                            name: 'name(code)',
                            labelText: 'Place Name(code)',
                            placeholder: 'Enter Place Name(code)',
                            onChanged: (value) => name = value,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FastTextField(
                            name: 'code',
                            labelText: 'Place Code',
                            placeholder: 'Enter Place Code',
                            onChanged: (value) => code = value,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FastTextField(
                            name: 'floor',
                            labelText: 'Floor',
                            placeholder: 'Enter Floor',
                            onChanged: (value) =>
                                floor = int.tryParse(value ?? '0'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FastTextField(
                            name: 'rotate angle',
                            labelText: 'angle',
                            placeholder: 'Enter rotate angle',
                            onChanged: (value) =>
                                rotateAngle = int.tryParse(value ?? '0'),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() async {
                                      shopPointersLocationsFirst
                                          .add(ShopPositionModel(
                                        x: x,
                                        y: y,
                                        name: name,
                                        code: code ?? '',
                                        floor: floor,
                                        rotateAngle: rotateAngle,
                                      ));

                                      await PositionsController
                                          .insertShopPostionFunc(context,
                                              xpoint: x.toString(),
                                              ypoint: y.toString(),
                                              nameEn: name,
                                              code: code,
                                              floor: floor.toString(),
                                              rotateAngle:
                                                  rotateAngle.toString(),
                                              type: 'SHOP',
                                              screenWidth:
                                                  currentSize.width.toInt(),
                                              screenHeight:
                                                  currentSize.height.toInt());
                                      // databaseInfo
                                      //     .insertShopPosition(ShopPositionModel(
                                      //         x: x,
                                      //         y: y,
                                      //         // name: name ?? '',
                                      //         name: code ?? '',
                                      //         code: code ?? '',
                                      //         //floor: floor ?? 1
                                      //         floor: 0));
                                      Navigator.pop(context);
                                    });
                                    // Navigator.pop(context);
                                  },
                                  child: Container(
                                      child: const Center(
                                          child: Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.greenAccent)),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      shopPointersLocationsFirst.removeLast();
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      child: const Center(
                                          child: Text('Cancel',
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.redAccent)),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
                  ]).show(context));
    }

    return CustomPaint(
        foregroundPainter: painter,
        child: Container(
          child: GestureDetector(
            // onTapUp: (TapUpDetails details) =>
            //onTapDown(details),
            //  _onRouteSelect(details),
            child: Stack(children: pointersOnImage(currentSize)),
          ),
        ));
  }
}

// DatabaseInfoService databaseInfo = DatabaseInfoService();
// setmypoints() async {
//   shopPointersLocationsFirst = await databaseInfo.getShopPositions(1);
//   PositionsController.shopPostionModel;
// }

Size currentSize = Size.zero;

class MyPainter extends CustomPainter {
  // int imageWidth = 610;
  //int imageHeight = 1576;
  double xratio = 0;
  double yratio = 0;
  List<RoutePositionModel>? routePoints;

  MyPainter(this.routePoints);
  @override
  void paint(Canvas canvas, Size size) {
    currentSize = size;
    for (var i = 0; i < routePoints!.length; i++) {
      if (routePoints!.length < i + 1) continue;

      if (routePoints!.elementAt(i).lineId !=
          routePoints!.elementAt(i + 1).lineId) {
        i++;
      }
      double xratio =
          size.width.toInt() / routePoints!.elementAt(i).screenWidth!;
      double yratio =
          size.height.toInt() / routePoints!.elementAt(i).screenHeight!;

      final p1 = Offset((routePoints!.elementAt(i).x! * xratio) + 0.0,
          routePoints!.elementAt(i).y! * yratio + 0.0);
      final p2 = Offset((routePoints!.elementAt(i + 1).x! * xratio) + 0.0,
          routePoints!.elementAt(i + 1).y! * yratio + 0.0);
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Colors.green
        ..strokeWidth = 1;
      //..blendMode = BlendMode.clear;

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
