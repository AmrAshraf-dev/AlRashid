import 'dart:convert';

import 'package:alrashid_mall_app/api/controllers/coupons_controller.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QRcode extends StatelessWidget {
  final String coponText;
  const QRcode({
    Key? key,
    required this.coponText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalState.instance.set("context", context);
    String code = json.encode(
      {
        "code": coponText,
       "userId": CouponsController.couponsModel.user?.id ?? 0,
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'QR Code',
          style: TextStyle(
            color: Color(0xff333333),
            fontFamily: ('DINNextLTArabic'),
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.clear,
            size: 30.0,
            color: Color(0xff333333),
          ),
        ),
      ),
      body: Center(
        child: QrImage(
          data: code,
          version: QrVersions.auto,
          size: 250.0,
        ),
      ),
    );
  }
}
