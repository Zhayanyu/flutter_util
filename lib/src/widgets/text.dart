import 'package:flutter/material.dart';
import '../models/text_model.dart';

class NRText extends StatelessWidget {

  const NRText(this.data, {Key key, this.model})
      : super(key: key);

  const NRText.data(this.data, {Key key, this.model})
      : super(key: key);

  const NRText.body2(this.data, {Key key, this.model})
      : super(key: key);

  /// data支持的类型[String,Map,List,NRTextModel]
  /// 默认 null.
  final data; //原则上 data > model > defaultModel

  final NRTextModel model;

  @override
  Widget build(BuildContext context) {
    NRTextModel currentModel = getCurrentTextModel();
    return _buildTextContainer(context,currentModel);
  }

  Widget _buildBgContainer(BuildContext context, NRTextModel model) {
    return Container();
  }

  Widget _buildTextContainer(BuildContext context, NRTextModel model) {
    return Container(
        constraints:model.boxConstraints,
        margin: model.margin,
        padding: model.padding,
        color: model.backgroundColor,
        child: _buildText(context,model),
    );
  }

  Widget _buildText(BuildContext context, NRTextModel model) {
    return Text(
      model.text,
      style: model.textStyle,
      maxLines: model.maxLines,
      textAlign: model.textAlign,
      textDirection: model.textDirection,
      textWidthBasis: model.textWidthBasis,
      textScaleFactor: model.textScaleFactor,);
  }

  NRTextModel getCurrentTextModel() {
    NRTextModel model = NRTextModel();
    if(this.data is String){
      model = model.copyWith(text: this.data);
    }else if(this.data is Map){
      model = NRTextModel.fromJson(this.data);
    }else if(this.data is NRTextModel){
      model = this.data;
    }
    return this.model != null ? this.model.merge(model) : model;
  }

}
