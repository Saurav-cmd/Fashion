import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

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
  final Color? defaultColor;
  bool? isSelected;
  Color? selectedColor;
  Color? tappedColor;
}
