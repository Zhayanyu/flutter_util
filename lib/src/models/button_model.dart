import 'dart:ui';
import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_util/src/utils/convert.dart';
import 'package:json_annotation/json_annotation.dart';

part 'button_model.g.dart';

enum ButtonStyleType {
  none,
  material,
  cupertino,
  flat,
}

@JsonSerializable(includeIfNull: false)
class NRButtonModel {
  NRButtonModel({
    this.type,
    this.minSize,
    this.pressedOpacity,
    this.padding,
  });

  @JsonKey(fromJson: NRConvert.parseButtonStyleType, toJson: NRConvert.buttonStyleTypeToJson)
  final ButtonStyleType type;

  final double minSize;

  final double pressedOpacity;

  @JsonKey(
      fromJson: NRConvert.parseEdgeInsets, toJson: NRConvert.edgeInsetsToJson)
  final EdgeInsetsGeometry padding;

  NRButtonModel copyWith({
    ButtonStyleType type,
    double minSize,
    double pressedOpacity,
    EdgeInsetsGeometry padding,
  }) {
    return NRButtonModel(
      type: type ?? this.type,
      minSize: minSize ?? this.minSize,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      padding: padding ?? this.padding,
    );
  }

  NRButtonModel merge(NRButtonModel other) {
    if (other == null) return this;
    return copyWith(
      type: other.type,
      minSize: other.minSize,
      pressedOpacity: other.pressedOpacity,
      padding: other.padding,
    );
  }

  factory NRButtonModel.fromJson(Map<String, dynamic> json) =>
      _$NRButtonModelFromJson(json);

  Map<String, dynamic> toJson() => _$NRButtonModelToJson(this);
}
