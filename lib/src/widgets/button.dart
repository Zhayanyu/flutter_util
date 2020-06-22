import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models.dart';

class NRButton extends StatelessWidget {
  const NRButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    @required this.model,
  }) :  _defaultModel=null,
        super(key: key);

  const NRButton.cupertino({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.model,
  }) :
        _defaultModel= const NRButtonModel(
          type: ButtonStyleType.cupertino,
          padding: EdgeInsets.only(),
          minSize: 20.0,
          pressedOpacity: 0.7,
        ),
        super(key: key);

  final Widget child;

  final VoidCallback onPressed;

  final NRButtonModel model;
  final NRButtonModel _defaultModel;

  @override
  Widget build(BuildContext context) {
    NRButtonModel currentModel = getCurrentButtonModel();
    switch (currentModel.type) {
      case ButtonStyleType.none:
        {
          return buildButton(context,currentModel);
        }
      case ButtonStyleType.cupertino:
        {
          return buildCupertinoButton(context,currentModel);
        }
      case ButtonStyleType.material:
        {
          return buildMaterialButton(context,currentModel);
        }
      case ButtonStyleType.flat:
        {
          return buildFlatButton(context,currentModel);
        }
      default:
        {
          return buildCupertinoButton(context,currentModel);
        }
    }
  }

  Widget buildButton(BuildContext context,NRButtonModel model) {
    return GestureDetector(
      child: child,
      onTap: onPressed,
    );
  }

  Widget buildMaterialButton(BuildContext context,NRButtonModel model) {
    return MaterialButton(
      child: child,
      onPressed: onPressed,
    );
  }

  Widget buildCupertinoButton(BuildContext context,NRButtonModel model) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
    );
  }

  Widget buildFlatButton(BuildContext context,NRButtonModel model) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }

  NRButtonModel getCurrentButtonModel() {
    NRButtonModel model = _defaultModel ?? NRButtonModel();
    return model.merge(this.model);
  }
}
