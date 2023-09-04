// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'dart:ui';

class ScreenUtil {
  static final ScreenUtil _instance = ScreenUtil._internal();

  static const int defaultWidth = 414;
  static const int defaultHeight = 896;

  late num uiWidthPx;
  late num uiHeightPx;
  late bool allowFontScaling;

  static double _screenWidth = 0.0;
  static double _screenHeight = 0.0;
  static double _pixelRatio = 0.0;
  static double _statusBarHeight = 0.0;
  static double _bottomBarHeight = 0.0;
  static double _textScaleFactor = 0.0;

  factory ScreenUtil() {
    return _instance;
  }

  ScreenUtil._internal();

  static void init(
      {num width = defaultWidth,
      num height = defaultHeight,
      bool allowFontScaling = false}) {
    _instance.uiWidthPx = width;
    _instance.uiHeightPx = height;
    _instance.allowFontScaling = allowFontScaling;
    _pixelRatio = window.devicePixelRatio;
    _screenWidth = window.physicalSize.width;
    _screenHeight = window.physicalSize.height;
    _statusBarHeight = window.padding.top;
    _bottomBarHeight = window.padding.bottom;
    _textScaleFactor = window.textScaleFactor;
  }

  static double get textScaleFactor => _textScaleFactor;

  static double get pixelRatio => _pixelRatio;

  static double get screenWidth => _screenWidth / _pixelRatio;

  static double get screenHeight => _screenHeight / _pixelRatio;

  static double get screenWidthPx => _screenWidth;

  static double get screenHeightPx => _screenHeight;

  static double get statusBarHeight => _statusBarHeight / _pixelRatio;

  static double get statusBarHeightPx => _statusBarHeight;

  static double get bottomBarHeight => _bottomBarHeight;

  double get scaleWidth => screenWidth / uiWidthPx;

  double get scaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiHeightPx;

  double get scaleText => scaleWidth;

  num setWidth(num width) => width * scaleWidth;

  num setHeight(num height) => height * scaleHeight;

  num setSp(num fontSize, {required bool allowFontScalingSelf}) =>
      allowFontScalingSelf == null
          ? (allowFontScaling
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor))
          : (allowFontScalingSelf
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor));
}
