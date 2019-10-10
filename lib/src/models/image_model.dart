import 'dart:ui';
import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:flutter_util/src/utils/convert.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable(includeIfNull: false)
class NRImageModel {
  NRImageModel({
    this.src,
    this.height,
    this.width,
    this.colorBlendMode,
    this.fit,
    this.repeat,
    this.centerSlice,
    this.matchTextDirection,
  });

  final dynamic src;
  final double height;
  final double width;

  @JsonKey(fromJson: NRConvert.parseBlendMode, toJson: NRConvert.blendModeToJson)
  final BlendMode colorBlendMode;

  @JsonKey(fromJson: NRConvert.parseBoxFit, toJson: NRConvert.boxFitToJson)
  final BoxFit fit;

  @JsonKey(fromJson: NRConvert.parseImageRepeat, toJson: NRConvert.imageRepeatToJson)
  final ImageRepeat repeat;

  @JsonKey(fromJson: NRConvert.parseRect, toJson: NRConvert.rectToJson)
  final Rect centerSlice;

  final bool matchTextDirection;

  NRImageModel copyWith({
    dynamic src,
    double height,
    double width,
    BlendMode colorBlendMode,
    BoxFit fit,
    ImageRepeat repeat,
    Rect centerSlice,
    bool matchTextDirection
  }) {
    return NRImageModel(
      src: src ?? this.src,
      height: height ?? this.height,
      width: width ?? this.width,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      fit: fit ?? this.fit,
      repeat: repeat ?? this.repeat,
      centerSlice: centerSlice ?? this.centerSlice,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
    );
  }

  NRImageModel merge(NRImageModel other) {
    if (other == null) return this;
    return copyWith(
      src: other.src,
      height: other.height,
      width: other.width,
      colorBlendMode: other.colorBlendMode,
      fit: other.fit,
      repeat: other.repeat,
      centerSlice: other.centerSlice,
      matchTextDirection: other.matchTextDirection,
    );
  }

  factory NRImageModel.fromJson(Map<String, dynamic> json) =>
      _$NRImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$NRImageModelToJson(this);
}
