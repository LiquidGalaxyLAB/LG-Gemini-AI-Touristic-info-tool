import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setPreferredOrientations(BuildContext context) {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]
  );
}