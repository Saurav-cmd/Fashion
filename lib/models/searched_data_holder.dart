class SearchedDataHolder {
  String? _colorName;
  String? _colorCode;
  String? _fandeck;
  String? _productName;
  double? _rValue;
  double? _gValue;
  double? _bValue;

  SearchedDataHolder(this._colorName, this._colorCode, this._fandeck,
      this._productName, this._rValue, this._gValue, this._bValue);

  double get bValue {
    return _bValue!;
  }

  set bValue(double value) {
    _bValue = value;
  }

  double get gValue => _gValue!;

  set gValue(double value) {
    _gValue = value;
  }

  double get rValue => _rValue!;

  set rValue(double value) {
    _rValue = value;
  }

  String get productName => _productName!;

  set productName(String value) {
    _productName = value;
  }

  String get fandeck => _fandeck!;

  set fandeck(String value) {
    _fandeck = value;
  }

  String get colorCode => _colorCode!;

  set colorCode(String value) {
    _colorCode = value;
  }

  String get colorName => _colorName!;

  set colorName(String value) {
    _colorName = value;
  }

/* SearchedDataHolder(
      {this._colorName,
      this._colorCode,
      this._fandeck,
      this._productName,
      this._rValue,
      this._gValue,
      this._bValue});*/
}
