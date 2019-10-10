import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_util/widgets.dart';
import 'package:flutter_util/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('NR组件展示'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  NRText('NRText展示'),
                  NRText('数据为 String'),
                  NRText({'text': '数据为 Map'}),
                  NRText(NRTextModel(text: '数据为 NRTextModel')),
                  Container(
                    height: 20.0,
                  ),
                  NRText('NRImage展示'),
                  NRImage('http://file.zhile88.com/icathia/1.png',
                      model: NRImageModel(height: 20.0, width: 20.0)),
                  NRImage('assets/2.png',model: NRImageModel(height: 20.0, width: 20.0)),
                  NRImage(AssetImage('assets/3.png'),model: NRImageModel(height: 20.0, width: 20.0)),
                  Container(
                    height: 20.0,
                  ),
                  NRText('NRButton展示'),
                  NRButton(
                    child: NRText('无风格按钮'),
                    onPressed: () {},
                    model: NRButtonModel(type: ButtonStyleType.none),
                  ),
                  NRButton(
                      child: NRText('flat风格按钮'),
                      onPressed: () {},
                      model: NRButtonModel(type: ButtonStyleType.flat)),
                  NRButton(
                      child: NRText('material风格按钮'),
                      onPressed: () {},
                      model: NRButtonModel(type: ButtonStyleType.material)),
                  NRButton(
                      child: NRText('cupertino风格按钮'),
                      onPressed: () {},
                      model: NRButtonModel(type: ButtonStyleType.cupertino)),
                ],
              ),
            ),
          )),
    );
  }
}
