import 'dart:ui';
import 'dart:core';

import 'convert.dart';
import 'package:flutter_util/src/utils/common.dart';

class NRTool {
  static bool isEmpty(value) {
    if (value != null) {
      if (value is String) {
        return value == '';
      } else if (value is Map) {
        return value.length == 0;
      } else if (value is List) {
        return value.length == 0;
      } else if (value is num) {
        return value.toInt() == 0;
      } else if (value == false) {
        return true;
      }
      return false;
    } else {
      return true;
    }
  }

  static bool isNotEmpty(value) {
    return !isEmpty(value);
  }

  static int parseInt(dynamic value) {
    return NRConvert.parseInt(value);
  }

  static double parseDouble(dynamic value, double initValue) {
    return NRConvert.parseDouble(value, initValue);
  }

}
