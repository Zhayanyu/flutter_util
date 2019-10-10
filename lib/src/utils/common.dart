import 'dart:ui';
import 'dart:core';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';
class NRCommon {
  static bool isAndroid() {
    return defaultTargetPlatform == TargetPlatform.android;
  }

  static bool isIOS() {
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  static bool isAllScreenDevice() {
    if(getHeight()/getWidth() >1.97){
      return true;
    }
    return false;
  }

  static double getHeight() {
    return window.physicalSize.height / window.devicePixelRatio;
  }

  static double getWidth() {
    return window.physicalSize.width / window.devicePixelRatio;
  }
}
