part of 'entity.dart';

double _lerpDouble(double a, double b, double t) {
  return a * (1.0 - t) + b * t;
}

class Point extends Entity {
  double x;
  double y;
  double z;

  int pointIndex = 0;

  Point(this.x, this.y, [this.z = 0]) : super(name: 'POINT');

  Point translate(double dx, double dy, [double dz = 0]) =>
      Point(x + dx, y + dy, z + dz);

  @override
  String toString() =>
      '${GroupCode.doublePrecision3DPointValue(10 + pointIndex, x)}'
      '\n${GroupCode.doublePrecision3DPointValue(20 + pointIndex, y)}'
      '\n${GroupCode.doublePrecision3DPointValue(30 + pointIndex, z)}';

  static Point? lerp(Point? a, Point? b, double t) {
    if (b == null) {
      if (a == null) {
        return null;
      } else {
        return a * (1.0 - t);
      }
    } else {
      if (a == null) {
        return b * t;
      } else {
        return Point(
          _lerpDouble(a.x, b.x, t),
          _lerpDouble(a.y, b.y, t),
          _lerpDouble(a.z, b.z, t),
        );
      }
    }
  }
}
