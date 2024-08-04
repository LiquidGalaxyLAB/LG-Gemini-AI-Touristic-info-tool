import 'dart:ui';

String listToBulletPoints(
  List<String> list,
) {
  return list.map((highlight) => '• $highlight').join('\n');
}

extension ColorToHex on Color {
  /// Converts the Color object to a hex string in the format #RRGGBB or #AARRGGBB.
  String toHex({bool includeAlpha = false}) {
    final alpha = includeAlpha ? this.alpha.toRadixString(16).padLeft(2, '0') : '';

    final red = this.red.toRadixString(16).padLeft(2, '0');
    final green = this.green.toRadixString(16).padLeft(2, '0');
    final blue = this.blue.toRadixString(16).padLeft(2, '0');

    return '#$alpha$red$green$blue'.toUpperCase();
  }
}