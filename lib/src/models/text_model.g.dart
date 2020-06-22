// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NRTextModel _$NRTextModelFromJson(Map<String, dynamic> json) {
  return NRTextModel(
    text: json['text'] as String,
    textStyleType: NRConvert.parseTextStyleType(json['textStyleType']),
    style: NRConvert.parseTextStyle(json['style']),
    textAlign: NRConvert.parseTextAlign(json['textAlign']),
    textDirection: NRConvert.parseTextDirection(json['textDirection']),
    overflow: NRConvert.parseTextOverflow(json['overflow']),
    textScaleFactor: (json['textScaleFactor'] as num)?.toDouble(),
    maxLines: json['maxLines'] as int,
    padding: NRConvert.parseEdgeInsets(json['padding']),
    margin: NRConvert.parseEdgeInsets(json['margin']),
    semanticsLabel: json['semanticsLabel'] as String,
    textWidthBasis: NRConvert.parseTextWidthBasis(json['textWidthBasis']),
    boxConstraints: NRConvert.parseBoxConstraints(json['boxConstraints']),
    borderRadius: NRConvert.parseBorderRadius(json['borderRadius']),
    backgroundColor: NRConvert.parseColor(json['backgroundColor']),
  );
}

Map<String, dynamic> _$NRTextModelToJson(NRTextModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('style', NRConvert.textStyleToJson(instance.style));
  writeNotNull('textAlign', NRConvert.textAlignToJson(instance.textAlign));
  writeNotNull(
      'textDirection', NRConvert.parseTextDecoration(instance.textDirection));
  writeNotNull('overflow', NRConvert.textOverflowToJson(instance.overflow));
  writeNotNull('textScaleFactor', instance.textScaleFactor);
  writeNotNull('maxLines', instance.maxLines);
  writeNotNull('semanticsLabel', instance.semanticsLabel);
  writeNotNull('padding', NRConvert.edgeInsetsToJson(instance.padding));
  writeNotNull('margin', NRConvert.edgeInsetsToJson(instance.margin));
  writeNotNull('textWidthBasis',
      NRConvert.textWidthBasisToJson(instance.textWidthBasis));
  writeNotNull(
      'textStyleType', NRConvert.textStyleTypeToJson(instance.textStyleType));
  writeNotNull('boxConstraints',
      NRConvert.boxConstraintsToJson(instance.boxConstraints));
  writeNotNull(
      'borderRadius', NRConvert.borderRadiusToJson(instance.borderRadius));
  writeNotNull(
      'backgroundColor', NRConvert.colorToInt(instance.backgroundColor));
  return val;
}
