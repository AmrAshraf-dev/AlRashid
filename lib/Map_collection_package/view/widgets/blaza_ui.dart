import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

import 'package:alrashid_mall_app/Map_collection_package/positions_data_controller.dart';
import 'package:alrashid_mall_app/database/database.dart';
import 'package:alrashid_mall_app/models/lines_model.dart';
import 'package:alrashid_mall_app/models/route_position.dart';

import '../../../models/shop_position.dart';

class BlazaFloorUI extends StatefulWidget {
  final int? fromId;
  final int? toId;
  final int? floor;
  final bool? showRoute;
  const BlazaFloorUI({
    Key? key,
    this.fromId,
    this.toId,
    this.floor,
    this.showRoute,
  }) : super(key: key);

  @override
  State<BlazaFloorUI> createState() => _BlazaFloorUIState();
}

List<ShopPositionModel> shopPointersLocations = [];
List<RoutePositionModel> routePositions = [];
LinesModel? lineBlaza;
List<LinesModel> lines = [];
pointersOnImage(Size? size) {
  List<Widget> returnList = [
    Image.asset(
      'assets/images/Blaza_floor-copy.jpg',
      fit: BoxFit.contain,
    ),
  ];

  for (var element in shopPointersLocations) {
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
                        width: 2,
                        height: 2.5,
                      ),
                      SizedBox(
                        child: Column(
                          children: List.generate(
                            element.name?.split(" ").length ?? 0,
                            (index) => Text(
                              element.name?.split(" ")[index] ?? '',
                              style: const TextStyle(
                                  fontSize: 1.3,
                                  overflow: TextOverflow.visible),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : RotationTransition(
                    turns: AlwaysStoppedAnimation(element.rotateAngle / 360),
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
                          width: 2,
                          height: 2.5,
                        ),
                        SizedBox(
                          child: Column(
                            children: List.generate(
                              element.name?.split(" ").length ?? 0,
                              (index) => Text(
                                element.name?.split(" ")[index] ?? '',
                                style: const TextStyle(
                                    fontSize: 1.3,
                                    overflow: TextOverflow.visible),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ];
  }

  return returnList;
}

class _BlazaFloorUIState extends State<BlazaFloorUI>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  final double _progress2 = 0.0;
  late Animation<double> animation;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    animation = Tween(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {
          _progress = animation.value;
        });
      });
    controller.forward();
    super.initState();
    setState(() {
      // routePositions = PositionsController.routePositionModel;
      shopPointersLocations = PositionsController.shopPostionModel;
      lines = PositionsController.lines;
      lineBlaza = PositionsController.line;
    });
  }

  @override
  Widget build(BuildContext context) {
    var painter = MyPainter(routePositions, _progress);
    MyPainter2 painter2 = MyPainter2(routePositions, _progress2);
    _onRouteSelect(TapUpDetails details) {
      var x = details.localPosition.dx.toInt();
      var y = details.localPosition.dy.toInt();
      Size size = currentSize;
      dynamic lineId = lineBlaza!.id;

      setState(() {
        routePositions.add(RoutePositionModel(
            x: x,
            y: y,
            screenWidth: size.width.toInt(),
            screenHeight: size.height.toInt(),
            lineId: lineId));
        print('lines modell iddd : ${lineBlaza!.id}');
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
        shopPointersLocations.add(ShopPositionModel(
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
                                      print('angglee foo2 : $rotateAngle');
                                      shopPointersLocations
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
                                    print('angglee : $rotateAngle');
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
                                      shopPointersLocations.removeLast();
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
        foregroundPainter: //widget.showRoute == true ? painter : painter2,
            painter,
        child: Container(
          child: GestureDetector(
            //onTapUp: (TapUpDetails details) =>
            //onTapDown(details),
            //   _onRouteSelect(details),
            child: Stack(children: pointersOnImage(currentSize)),
          ),
        ));
  }
}

DatabaseInfoService databaseInfo = DatabaseInfoService();
setmypoints() async {
  shopPointersLocations = await databaseInfo.getShopPositions(1);
  PositionsController.shopPostionModel;
}

Size currentSize = Size.zero;

class MyPainter extends CustomPainter {
  final double _progress;
  double xratio = 0;
  double yratio = 0;
  List<RoutePositionModel>? routePoints;

  MyPainter(this.routePoints, this._progress);
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

      final p1 = Offset((routePoints!.elementAt(i).x! * xratio.toDouble()),
          routePoints!.elementAt(i).y! * yratio.toDouble());
      final p2 = Offset((routePoints!.elementAt(i + 1).x! * xratio).toDouble(),
          (routePoints!.elementAt(i + 1).y! * yratio));

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Colors.blueGrey
        ..filterQuality = FilterQuality.high
        //..blendMode = BlendMode.hardLight
        //..invertColors = true
        ..strokeWidth = 1.5;

      canvas.drawLine(p1, p2, paint);

      //
      // final arrowPainter = Paint();
      // ..color = paint.color
      //..strokeWidth = paint.strokeWidth
      //..style = PaintingStyle.stroke;
      // canvas.drawLine(p1, p2, paint);
      // final _pathOffset = paint.strokeWidth / 350;
      // var path = Path()
      //   ..lineTo(-15 * _pathOffset, 20 * _pathOffset)
      //   ..lineTo(-15 * _pathOffset, -20 * _pathOffset)
      //   ..close();
      // canvas.save();
      // canvas.translate(p2.dx, p2.dy);
      // canvas.rotate((p2 - p1).direction);
      // canvas.drawPath(path, arrowPainter);
      // canvas.restore();
    }
  }

  // @override
  // bool shouldRepaint(CustomPainter old) {
  //   return false;
  // }
  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return oldDelegate._progress != _progress;
  }

  // void drawArrow(Canvas canvas, Offset start, Offset end, Paint painter) {
  //   final arrowPainter = Paint()
  //     ..color = painter.color
  //     ..strokeWidth = painter.strokeWidth
  //     ..style = PaintingStyle.stroke;
  //   canvas.drawLine(start, end, painter);
  //   final _pathOffset = painter.strokeWidth / 15;
  //   var path = Path()
  //     ..lineTo(-15 * _pathOffset, 10 * _pathOffset)
  //     ..lineTo(-15 * _pathOffset, -10 * _pathOffset)
  //     ..close();
  //   canvas.save();
  //   canvas.translate(end.dx, end.dy);
  //   canvas.rotate((end - start).direction);
  //   canvas.drawPath(path, arrowPainter);
  //   canvas.restore();
  // }
}

class MyPainter2 extends CustomPainter {
  List<RoutePositionModel>? routePoints2;
  final double _progress2;
  MyPainter2(this.routePoints2, this._progress2);
  @override
  void paint(Canvas canvas, Size size) {
    //
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
