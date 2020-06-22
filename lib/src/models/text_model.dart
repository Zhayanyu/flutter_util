import 'dart:ui';
import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_util/src/utils/convert.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text_model.g.dart';

enum TextStyleType {
  /// none.
  none,
  solid,
}

@JsonSerializable(includeIfNull: false)
class NRTextModel {
  const NRTextModel({
    this.text,
    this.textStyleType,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.padding,
    this.margin,
    this.semanticsLabel,
    this.textWidthBasis,
    this.boxConstraints,
    this.borderRadius,
    this.backgroundColor,
  });

  final String text;

  @JsonKey(fromJson: NRConvert.parseTextStyle, toJson: NRConvert.textStyleToJson)
  final TextStyle style;

  @JsonKey(fromJson: NRConvert.parseTextAlign, toJson: NRConvert.textAlignToJson)
  final TextAlign textAlign;

  @JsonKey(fromJson: NRConvert.parseTextDirection, toJson: NRConvert.parseTextDecoration)
  final TextDirection textDirection;

  @JsonKey(fromJson: NRConvert.parseTextOverflow, toJson: NRConvert.textOverflowToJson)
  final TextOverflow overflow;

  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;

  @JsonKey(fromJson: NRConvert.parseEdgeInsets, toJson: NRConvert.edgeInsetsToJson)
  final EdgeInsetsGeometry padding;

  @JsonKey(fromJson: NRConvert.parseEdgeInsets, toJson: NRConvert.edgeInsetsToJson)
  final EdgeInsetsGeometry margin;

  @JsonKey(fromJson: NRConvert.parseTextWidthBasis, toJson: NRConvert.textWidthBasisToJson)
  final TextWidthBasis textWidthBasis;

  @JsonKey(fromJson: NRConvert.parseTextStyleType, toJson: NRConvert.textStyleTypeToJson)
  final TextStyleType textStyleType;

  @JsonKey(fromJson: NRConvert.parseBoxConstraints, toJson: NRConvert.boxConstraintsToJson)
  final BoxConstraints boxConstraints;

  @JsonKey(fromJson: NRConvert.parseBorderRadius, toJson: NRConvert.borderRadiusToJson)
  final BorderRadius borderRadius;

  @JsonKey(fromJson: NRConvert.parseColor, toJson: NRConvert.colorToInt)
  final Color backgroundColor;


  NRTextModel copyWith({
    String text,
    TextStyleType textStyleType,
    TextStyle style,
    TextAlign textAlign,
    TextDirection textDirection,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry margin,
    String semanticsLabel,
    TextWidthBasis textWidthBasis,
    BoxConstraints boxConstraints,
    BorderRadius borderRadius,
    Color backgroundColor,
  }){
    return NRTextModel(
      text: text ?? this.text,
      textStyleType: textStyleType ?? this.textStyleType,
      style: this.style != null ? this.style.merge(style) : style,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      boxConstraints: boxConstraints ?? this.boxConstraints,
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  NRTextModel merge(NRTextModel other) {
    if (other == null)
      return this;
    return copyWith(
      text: other.text,
      textStyleType: other.textStyleType,
      style: other.style,
      textAlign: other.textAlign,
      textDirection: other.textDirection,
      overflow: other.overflow,
      textScaleFactor: other.textScaleFactor,
      maxLines: other.maxLines,
      padding: other.padding,
      margin: other.margin,
      semanticsLabel: other.semanticsLabel,
      textWidthBasis: other.textWidthBasis,
      boxConstraints: other.boxConstraints,
      borderRadius: other.borderRadius,
      backgroundColor: other.backgroundColor,
    );
  }

  factory NRTextModel.fromJson(Map<String, dynamic> json) => _$NRTextModelFromJson(json);

  Map<String, dynamic> toJson() => _$NRTextModelToJson(this);
}
