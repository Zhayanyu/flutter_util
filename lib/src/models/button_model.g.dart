// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NRButtonModel _$NRButtonModelFromJson(Map<String, dynamic> json) {
  return NRButtonModel(
    type: NRConvert.parseButtonStyleType(json['type']),
    minSize: (json['minSize'] as num)?.toDouble(),
    pressedOpacity: (json['pressedOpacity'] as num)?.toDouble(),
    padding: NRConvert.parseEdgeInsets(json['padding']),
  );
}

Map<String, dynamic> _$NRButtonModelToJson(NRButtonModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', NRConvert.buttonStyleTypeToJson(instance.type));
  writeNotNull('minSize', instance.minSize);
  writeNotNull('pressedOpacity', instance.pressedOpacity);
  writeNotNull('padding', NRConvert.edgeInsetsToJson(instance.padding));
  return val;
}
