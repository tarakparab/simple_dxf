part of 'entity.dart';

class Point extends Entity {
  double x;
  double y;
  double z;

  int pointIndex = 0;

  Point({
    required this.x,
    required this.y,
    required this.z,
  }) : super(name: 'POINT');

  Point translate(double dx, double dy, double dz) =>
      Point(x: x + dx, y: y + dy, z: z + dz);

  @override
  String toString() =>
      '${GroupCode.doublePrecision3DPointValue(10 + pointIndex, x)}'
      '\n${GroupCode.doublePrecision3DPointValue(20 + pointIndex, y)}'
      '\n${GroupCode.doublePrecision3DPointValue(30 + pointIndex, z)}';
}
