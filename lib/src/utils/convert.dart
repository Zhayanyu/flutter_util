import 'dart:ui';
import 'dart:core';
import 'package:flutter/material.dart';

import '../../models.dart';
import 'common.dart';
import 'tool.dart';

class NRConvert {
  static int parseInt(dynamic value) {
    return parseDouble(value, 0.0).toInt();
  }

  static double parseDouble(dynamic value, double initValue) {
    return value is double
        ? value
        : value is num
            ? value.toDouble()
            : value is String ? double.tryParse(value) ?? initValue : initValue;
  }

  static BoxConstraints parseBoxConstraints(dynamic value) {
    if (NRTool.isNotEmpty(value) && value is Map) {
      return new BoxConstraints().copyWith(
        minHeight: NRTool.isNotEmpty(value['minHeight'])
            ? parseDouble(value['minHeight'], 0.0)
            : null,
        maxHeight: NRTool.isNotEmpty(value['maxHeight'])
            ? parseDouble(value['maxHeight'], 0.0)
            : null,
        maxWidth: NRTool.isNotEmpty(value['maxWidth'])
            ? parseDouble(value['maxWidth'], 0.0)
            : null,
        minWidth: NRTool.isNotEmpty(value['minWidth'])
            ? parseDouble(value['minWidth'], 0.0)
            : null,
      );
    }
    return null;
  }

  static Map boxConstraintsToJson(BoxConstraints boxConstraints) {
    return {
      'minHeight': boxConstraints.minHeight,
      'minWidth': boxConstraints.minWidth,
      'maxHeight': boxConstraints.maxHeight,
      'maxWidth': boxConstraints.maxWidth,
    };
  }

  static BoxBorder parseBoxBorder(var value, [color = 0]) {
    if (NRTool.isNotEmpty(value) && value is Map) {
      return new Border.all(
          width: parseDouble(value['width'], 1.0),
          color: parseColor(NRTool.isNotEmpty(color) ? color : value['color']));
    }
    return null;
  }

  static Gradient parseGradient(var value) {
    if (NRTool.isNotEmpty(value) && value is Map) {
      Map gradient = value;
      if (NRTool.isNotEmpty(gradient['color']) && gradient['color'] is List) {
        List<int> colorData = List.from(gradient['color']);
        List<Color> colors = [];
        for (int index = 0; index < colorData.length; index++) {
          colors.add(parseColor(colorData[index]));
        }
        Alignment _begin = parseAlignment(gradient['begin']);
        if (_begin == null) {
          _begin = Alignment.topLeft;
        }

        Alignment _end = parseAlignment(gradient['end']);
        if (_end == null) {
          _end = Alignment.bottomRight;
        }

        return new LinearGradient(
          begin: _begin,
          end: _end,
          colors: colors,
        );
      }
    }
    return null;
  }

  static CrossAxisAlignment parseCrossAxisAlignment(var value) {
    if (value is String) {
      switch (value) {
        case 'start':
          {
            return CrossAxisAlignment.start;
          }
        case 'end':
          {
            return CrossAxisAlignment.end;
          }
        case 'center':
          {
            return CrossAxisAlignment.center;
          }
        case 'stretch':
          {
            return CrossAxisAlignment.stretch;
          }
        case 'baseline':
          {
            return CrossAxisAlignment.baseline;
          }
      }
    }
    return CrossAxisAlignment.start;
  }

  static MainAxisAlignment parseMainAxisAlignment(var value) {
    if (value is String) {
      switch (value) {
        case 'start':
          {
            return MainAxisAlignment.start;
          }
        case 'end':
          {
            return MainAxisAlignment.end;
          }
        case 'center':
          {
            return MainAxisAlignment.center;
          }
        case 'spaceBetween':
          {
            return MainAxisAlignment.spaceBetween;
          }
        case 'spaceAround':
          {
            return MainAxisAlignment.spaceAround;
          }
        case 'spaceEvenly':
          {
            return MainAxisAlignment.spaceEvenly;
          }
      }
    }
    return MainAxisAlignment.start;
  }

  static Alignment parseAlignment(var value) {
    if (value is String) {
      switch (value) {
        case 'topLeft':
          {
            return Alignment.topLeft;
          }
        case 'topCenter':
          {
            return Alignment.topCenter;
          }
        case 'topRight':
          {
            return Alignment.topRight;
          }
        case 'centerLeft':
          {
            return Alignment.centerLeft;
          }
        case 'centerRight':
          {
            return Alignment.centerRight;
          }
        case 'center':
          {
            return Alignment.center;
          }
        case 'bottomLeft':
          {
            return Alignment.bottomLeft;
          }
        case 'bottomCenter':
          {
            return Alignment.bottomCenter;
          }
        case 'bottomRight':
          {
            return Alignment.bottomRight;
          }
      }
    }

    if (NRTool.isNotEmpty(value) && value is List<double>) {
      return new Alignment(value.first, value.last);
    }

    return null;
  }

  static String alignmentToJson(alignment) {
    return enumValueToString(alignment);
  }

  static TextStyle parseTextStyle(var value) {
    return TextStyle();
  }

  static Map textStyleToJson(TextStyle textStyle) {
    return {};
  }

  static TextAlign parseTextAlign(var value) {
    if (value is String) {
      switch (value) {
        case 'left':
          {
            return TextAlign.left;
          }
        case 'right':
          {
            return TextAlign.right;
          }
        case 'center':
          {
            return TextAlign.center;
          }
        case 'justify':
          {
            return TextAlign.justify;
          }
        case 'start':
          {
            return TextAlign.start;
          }
        case 'end':
          {
            return TextAlign.end;
          }
      }
    }
    return TextAlign.left;
  }

  static String textAlignToJson(textAlign) {
    return enumValueToString(textAlign);
  }

  static BorderRadius parseBorderRadius(var value) {
    return BorderRadius.all(Radius.circular(0.0));
  }

  static Map borderRadiusToJson(borderRadius) {
    return {};
  }

  static BoxDecoration parseBoxDecoration(var value) {
    return BoxDecoration();
  }

  static String boxDecorationToJson(boxDecoration) {
    return '';
  }

  static TextStyleType parseTextStyleType(var value) {
    return getEnumValueFromMap(TextStyleType.values, value) ??
        TextStyleType.none;
  }

  static String textStyleTypeToJson(textStyleType) {
    return enumValueToString(textStyleType);
  }

  static TextWidthBasis parseTextWidthBasis(var value) {
    return getEnumValueFromMap(TextWidthBasis.values, value) ??
        TextWidthBasis.parent;
  }

  static String textWidthBasisToJson(textWidthBasis) {
    return enumValueToString(textWidthBasis);
  }

  static BlendMode parseBlendMode(var value) {
    return getEnumValueFromMap(BlendMode.values, value) ?? BlendMode.src;
  }

  static String blendModeToJson(blendMode) {
    return enumValueToString(blendMode);
  }

  static BoxFit parseBoxFit(var value) {
    return getEnumValueFromMap(BoxFit.values, value) ?? BoxFit.cover;
  }

  static String boxFitToJson(boxFit) {
    return enumValueToString(boxFit);
  }

  static ImageRepeat parseImageRepeat(var value) {
    return getEnumValueFromMap(ImageRepeat.values, value) ?? ImageRepeat.repeat;
  }

  static String imageRepeatToJson(imageRepeat) {
    return enumValueToString(imageRepeat);
  }

  static TextDirection parseTextDirection(var value) {
    return getEnumValueFromMap(TextDirection.values, value) ??
        TextDirection.ltr;
  }

  static String textDirectionToJson(textDirection) {
    return enumValueToString(textDirection);
  }

  static TextDecoration parseTextDecoration(var value) {
    if (value is String) {
      switch (value) {
        case 'none':
          {
            return TextDecoration.none;
          }
        case 'underline':
          {
            return TextDecoration.none;
          }
        case 'overline':
          {
            return TextDecoration.overline;
          }
        case 'lineThrough':
          {
            return TextDecoration.lineThrough;
          }
      }
    }
    return TextDecoration.none;
  }

  static String textDecorationToJson(textDecoration) {
    return enumValueToString(textDecoration);
  }

  static Rect parseRect(var value) {
    if (value is Map) {
      return Rect.fromLTRB(
        value['left'],
        value['right'],
        value['top'],
        value['bottom'],
      );
    }
    return Rect.zero;
  }

  static String rectToJson(Rect rect) {
    if(rect == null)
      return null;

    return enumValueToString({
      'left': rect.left,
      'right': rect.right,
      'top': rect.top,
      'bottom': rect.bottom,
    });
  }

  static TextOverflow parseTextOverflow(var value) {
    return getEnumValueFromMap(TextOverflow.values, value) ?? TextOverflow.fade;
  }

  static String textOverflowToJson(textOverflow) {
    return enumValueToString(textOverflow);
  }

  static ButtonStyleType parseButtonStyleType(var value) {
    return getEnumValueFromMap(ButtonStyleType.values, value) ?? ButtonStyleType.cupertino;
  }

  static String buttonStyleTypeToJson(buttonStyleType) {
    return enumValueToString(buttonStyleType);
  }

  static EdgeInsets parseEdgeInsets(var value) {
    if (value is Map) {
      if (NRTool.isNotEmpty(value['vertical']) ||
          NRTool.isNotEmpty(value['horizontal'])) {
        return new EdgeInsets.symmetric(
          vertical: parseDouble(value['vertical'], 0.0),
          horizontal: parseDouble(value['horizontal'], 0.0),
        );
      } else {
        return new EdgeInsets.only(
          left: parseDouble(value['left'], 0.0),
          right: parseDouble(value['right'], 0.0),
          top: parseDouble(value['top'], 0.0),
          bottom: parseDouble(value['bottom'], 0.0),
        );
      }
    } else {
      return new EdgeInsets.all(parseDouble(value, 0.0));
    }
  }

  static Map edgeInsetsToJson(EdgeInsets edgeInsets) {
    return {
      'left': edgeInsets.left,
      'right': edgeInsets.right,
      'top': edgeInsets.top,
      'bottom': edgeInsets.bottom,
    };
  }

  static Color parseColor(var value) {
    if (value is String && value.contains('#', 0)) {
      value = value.replaceAll('#', '');
      return parseColoFromInt(int.parse(value, radix: 16));
    }
    return parseColoFromInt(parseInt(value));
  }

  static Color parseColoFromInt(int value) {
    return Color(value);
  }

  static String colorToString(Color color) {
    return color.toString();
  }

  static double parseAutoFontSize(double value) {
    return NRCommon.isAndroid() ? value - 1 : value;
  }

  static FontWeight parseFontWeight(var value) {
    if (value is String) {
      switch (value) {
        case 'normal':
          {
            return FontWeight.normal;
          }
        case 'bold':
          {
            return FontWeight.bold;
          }
      }
    }
    return parseFontWeightFromInt(parseInt(value));
  }

  static FontWeight parseFontWeightFromInt(int value) {
    if (value >= 0 && value < 9) {
      return FontWeight.values[value];
    } else {
      return FontWeight.normal;
    }
  }

  /*时间格式化*/
  static parseWeekDayFromDateTime(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        {
          return '星期一';
        }
      case DateTime.tuesday:
        {
          return '星期二';
        }
      case DateTime.wednesday:
        {
          return '星期三';
        }
      case DateTime.thursday:
        {
          return '星期四';
        }
      case DateTime.friday:
        {
          return '星期五';
        }
      case DateTime.saturday:
        {
          return '星期六';
        }
      case DateTime.sunday:
        {
          return '星期天';
        }
      default:
        {
          return '';
        }
    }
  }

  static getEnumValueFromMap(List values, String key) {
    Map map = enumValuesToMap(values);
    return map[key];
  }

  static Map enumValuesToMap(List values) {
    // 将 enum 元素的全拼和简写都作为key
    Map map = {};
    values.forEach((item) {
      String key = enumValueToString(item);
      map.addAll({key: item, item.toString(): item});
    });
    return map;
  }

  static String enumValueToString(dynamic value) {
    // 获取enum 简写
    return value.toString().split('.').last;
  }
}
