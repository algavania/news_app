import 'dart:ui';

class ColorValues {
  static const background = Color(0xFFFAFAFA);
  static const primary50 = Color(0xFF02BBDD);
  static const primary40 = Color(0xFF35C9E4);
  static const primary30 = Color(0xFF67D6EB);
  static const primary20 = Color(0xFF9AE4F1);
  static const primary10 = Color(0xFFCCF1F8);
  static const grey50 = Color(0xFF5F6265);
  static const grey30 = Color(0xFF9FA1A3);
  static const grey20 = Color(0xFFBFC0C1);
  static const grey10 = Color(0xFFDFE0E0);
  static const text50 = Color(0xFF1D1D1D);
  static const text20 = Color(0xFFA5A5A5);
  static const danger50 = Color(0xFFDC3545);
  static const success50 = Color(0xFF41C063);
  static const success40 = Color(0xFF67CD82);
  static const success10 = Color(0xFFD9F2E0);
  static const secondary50 = Color(0xFFFFB703);
  static const secondary20 = Color(0xFFFFB703);
  static const secondary10 = Color(0xFFFFF1CD);
  static const pink50 = Color(0xFFF8627F);

  static Color lighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round()
    );
  }

  static Color darken(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(
        c.alpha,
        (c.red * f).round(),
        (c.green  * f).round(),
        (c.blue * f).round()
    );
  }
}
