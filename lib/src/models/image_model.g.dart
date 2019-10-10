// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NRImageModel _$NRImageModelFromJson(Map<String, dynamic> json) {
  return NRImageModel(
    src: json['src'],
    height: (json['height'] as num)?.toDouble(),
    width: (json['width'] as num)?.toDouble(),
    colorBlendMode: NRConvert.parseBlendMode(json['colorBlendMode']),
    fit: NRConvert.parseBoxFit(json['fit']),
    repeat: NRConvert.parseImageRepeat(json['repeat']),
    centerSlice: NRConvert.parseRect(json['centerSlice']),
    matchTextDirection: json['matchTextDirection'] as bool,
  );
}

Map<String, dynamic> _$NRImageModelToJson(NRImageModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('src', instance.src);
  writeNotNull('height', instance.height);
  writeNotNull('width', instance.width);
  writeNotNull(
      'colorBlendMode', NRConvert.blendModeToJson(instance.colorBlendMode));
  writeNotNull('fit', NRConvert.boxFitToJson(instance.fit));
  writeNotNull('repeat', NRConvert.imageRepeatToJson(instance.repeat));
  writeNotNull('centerSlice', NRConvert.rectToJson(instance.centerSlice));
  writeNotNull('matchTextDirection', instance.matchTextDirection);
  return val;
}