import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

Shape shapeFromJson(String str) => Shape.fromJson(json.decode(str));

String shapeToJson(Shape data) => json.encode(data.toJson());

class Shape {
  Shape(strPath, this.label, this.defaultColor, this.isSelected,
      this.selectedColor, this.tappedColor)
      : _path = parseSvgPathData(strPath);

  /// transforms a [_path] into [_transformedPath] using given [matrix]
  void transform(Matrix4 matrix) =>
      _transformedPath = _path!.transform(matrix.storage);
  Path? _path;
  Path? _transformedPath;
  String? label;
  Color? defaultColor;
  bool? isSelected;
  Color? selectedColor;
  Color? tappedColor;

  Shape.fromJson(Map<String, dynamic> json) {
    _path = json['path'];
    label = json['label'];
    defaultColor = json['defaultColor'];
    isSelected = json['isSelected'];
    selectedColor = json['selectedColor'];
    tappedColor = json['tappedColor'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['path'] = _path;
    _data['label'] = label;
    _data['defaultColor'] = defaultColor;
    _data['isSelected'] = isSelected;
    _data['selectedColor'] = selectedColor;
    _data['tappedColor'] = tappedColor;
    return _data;
  }
}
