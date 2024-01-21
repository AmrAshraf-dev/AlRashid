import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  Debouncer({
    this.milliseconds,
    this.action,
    this.timer,
  });

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds!), action);
  }
}
