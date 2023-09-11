import '../../simple_dxf.dart';
import 'dart:math' as math;

extension JoinExt on Iterable {
  /// Convert entries to strings and join the strings with new line
  String nlJoin() => join('\n');
}

extension NullCheck on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

extension RotatePointExt on Point {
  Point operator +(Point other) => Point(x + other.x, y + other.y, z + other.z);
  Point operator -(Point other) => Point(x - other.x, y - other.y, z - other.z);
  Point operator *(double operand) =>
      Point(x * operand, y * operand, z * operand);

  /// [angle] in radians clockwise
  Point rotate(Point pivot, double angle) {
    final delta = this - pivot;
    var cos = math.cos(angle);
    var sin = math.sin(angle);
    return pivot +
        Point(delta.x * cos, delta.x * sin, delta.z) +
        Point(-delta.y * sin, delta.y * cos, delta.z);
  }
}

extension LinePropertiesExt on Line {
  double get x => p2.x - p1.x;
  double get y => p2.y - p1.y;
  Point get centre => Point.lerp(p1, p2, 0.5)!;

  double get length => math.sqrt(x * x + y * y);

  double get slope => y / x;
  double get inclination => math.atan2(y, x);

  // Normalised components
  double get ux => x / length;
  double get uy => y / length;
}

extension ConversionExt on DateTime {
  /// [Special Handling of Date/Time Variables (DXF)](https://help.autodesk.com/view/OARX/2024/ENU/?guid=GUID-6942BAF3-095F-4217-9F61-6931975D3A64)
  ///
  /// [Julian day](https://en.wikipedia.org/wiki/Julian_day)
  ///
  /// [Calendar Converter](https://www.fourmilab.ch/documents/calendar/)
  ///
  /// [Julian and Gregorian calendars](https://planetcalc.com/505/)
  ///
  /// Using [Julian to Gregorian calendar convertor](https://planetcalc.com/7116/)
  /// the date January 1st, 4713 BC was coverted to equivalant Gregorian
  /// date November 24th, 4714 BC. Concidering this as the baseline date duration
  /// to any date-time is calculated in terms of days.
  double get toJulianDays {
    final julianDate = DateTime.utc(-4713, 11, 24);
    final days = toUtc().difference(julianDate).inSeconds / 24 / 60 / 60;
    return days;
  }
}
