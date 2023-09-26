part of 'entity.dart';

class Vertex extends Entity {
  double x;
  double y;
  double z;

  /// Vertex flags:
  /// - 1 = Extra vertex created by curve-fitting
  /// - 2 = Curve-fit tangent defined for this vertex. A curve-fit tangent direction of 0 may be omitted from DXF output but is significant if this bit is set
  /// - 4 = Not used
  /// - 8 = Spline vertex created by spline-fitting
  /// - 16 = Spline frame control point
  /// - 32 = 3D polyline vertex
  /// - 64 = 3D polygon mesh
  /// - 128 = Polyface mesh vertex
  final int? flag;

  Vertex(
    this.x,
    this.y, {
    this.z = 0,
    this.flag,
  }) : super(name: 'VERTEX');

  @override
  String toString() => '${GroupCode.type(name)}'
      '\n${GroupCode.layerName(layer)}'
      '\n${GroupCode.doublePrecision3DPointValue(10, x)}'
      '\n${GroupCode.doublePrecision3DPointValue(20, y)}'
      '\n${GroupCode.doublePrecision3DPointValue(30, z)}';

  Vertex translate(double dx, double dy, [double dz = 0]) =>
      Vertex(x + dx, y + dy, z: z + dz);

  Point toPoint() => Point(x, y);
}
