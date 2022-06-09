import 'dart:ui';

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

class Constants {
  static var screenWidth = (window.physicalSize.shortestSide / window.devicePixelRatio);
  static var screenHeight = (window.physicalSize.longestSide / window.devicePixelRatio);
}
