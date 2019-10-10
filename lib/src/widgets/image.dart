import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models.dart';

class NRImage extends StatelessWidget {
  const NRImage(this.data,{Key key, this.model , }) : super(key: key);

  /// data支持的类型[Url,Asset,File,Uint8List]
  /// 默认 null.
  final data; //原则上 data > model > defaultModel

  final NRImageModel model;

  @override
  Widget build(BuildContext context) {
    NRImageModel currentModel = getCurrentImageModel();
    if (currentModel.src is String) {
      if (currentModel.src.startsWith('http')) {
        return _buildCachedNetworkImage(context, currentModel);
      } else {
        return _buildAssetImage(context, currentModel);
      }
    } else if (currentModel.src is File) {
      return _buildFileImage(context, currentModel);
    } else if (currentModel.src is Uint8List) {
      return _buildMemoryImage(context, currentModel);
    } else if (currentModel.src is ImageProvider){
      return _buildImage(context, currentModel);
    }
    return _buildDefaultImage(context, currentModel);
  }

  Widget _buildImage(BuildContext context, NRImageModel model) {
    return Image(
      image:model.src,
      height: model.height,
      width: model.width,
    );
  }

  Widget _buildCachedNetworkImage(BuildContext context, NRImageModel model) {
    return CachedNetworkImage(
      imageUrl: model.src,
      height: model.height,
      width: model.width,
    );
  }

  Widget _buildAssetImage(BuildContext context, NRImageModel model) {
    return Image.asset(
      model.src,
      height: model.height,
      width: model.width,
    );
  }

  Widget _buildFileImage(BuildContext context, NRImageModel model) {
    return Image.file(
      model.src,
      height: model.height,
      width: model.width,
    );
  }

  Widget _buildMemoryImage(BuildContext context, NRImageModel model) {
    return Image.memory(
      model.src,
      height: model.height,
      width: model.width,
    );
  }

  Widget _buildDefaultImage(BuildContext context, NRImageModel model) {
    return Container();
  }

  NRImageModel getCurrentImageModel() {
    NRImageModel _model =  NRImageModel();
    if(this.data != null){
      _model = _model.copyWith(src: this.data);
    }
    return this.model != null ? this.model.merge(_model) : _model;
  }
}
