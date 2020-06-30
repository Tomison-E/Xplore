import 'package:flutter/widgets.dart';

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'MyFlutterAppIcons';
  static const _kFontFamC = 'MyFlutterAppIcon';
  static const _kFontPkg = null;
  static const _kFontFamB = 'MyFlutterApp';

  static const IconData sun_inv = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menu = IconData(0xe871, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData arrow_down = IconData(0xe878, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData custom_menu = IconData(0xe800, fontFamily: _kFontFamB, fontPackage: _kFontPkg);
  static const IconData rain_inv = IconData(0xe800, fontFamily: _kFontFamC, fontPackage: _kFontPkg);
  static const IconData moon = IconData(0xf186, fontFamily: _kFontFamC, fontPackage: _kFontPkg);
}
