import 'package:alrashid_mall_app/utils/coordinates/blaza_stores_coordinates.dart';
import 'package:flutter/material.dart';

class TestUI extends StatelessWidget {
   const TestUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return CustomPaint(
      size: Size(size.width / 610, size.height / 1576),
      foregroundPainter: MyPainter(),
      child: Container(
        child: Image.asset(
          'assets/images/BF l Al Qaisariyah 2.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var points = BlazaStoresCoordinates.currentCoordinates;
    for (var i = 0; i < points.length; i++) {
      if (points.length < i + 1) continue;
      var xratio = size.width / 610;
      var yratio = size.height / 1576;
      final p1 = Offset(
          (points.elementAt(i)[0] * xratio), points.elementAt(i)[1] * yratio);
      final p2 = Offset(points.elementAt(i + 1)[0] * xratio,
          points.elementAt(i + 1)[1] * yratio);
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Colors.green
        ..strokeWidth = 3;

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
