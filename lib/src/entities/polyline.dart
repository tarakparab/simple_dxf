part of 'entity.dart';

class Polyline extends Entity {
  Polyline({required this.vertices, this.flag, this.elevation = 0})
      : super(name: 'POLYLINE');

  List<Vertex> vertices;
  double elevation;

  /// Polyline flags:
  /// - 0 = default
  /// - 1 = This is a closed polyline (or a polygon mesh closed in the M direction)
  /// - 2 = Curve-fit vertices have been added
  /// - 4 = Spline-fit vertices have been added
  /// - 8 = This is a 3D polyline
  /// - 16 = This is a 3D polygon mesh
  /// - 32 = The polygon mesh is closed in the N direction
  /// - 64 = The polyline is a polyface mesh
  /// - 128 = The linetype pattern is generated continuously around the vertices
  /// of this polyline
  final int? flag;

  /// [Autodesk DXF Reference > Entities Section > POLYLINE](https://help.autodesk.com/view/OARX/2024/ENU/?guid=GUID-ABF6B778-BE20-4B49-9B58-A94E64CEFFF3)
  /// > APP: a “dummy” point; the X and Y values are always 0, and the Z value
  /// is the polyline's elevation (in OCS when 2D, WCS when 3D)
  ///
  /// Currently elevation = 0;
  Point get _dummyPoint => Point(0, 0, elevation);

  /// [Autodesk DXF Reference > Entities Section > POLYLINE](https://help.autodesk.com/view/OARX/2024/ENU/?guid=GUID-ABF6B778-BE20-4B49-9B58-A94E64CEFFF3)
  /// > Obsolete; formerly an “entities follow flag” (optional; ignore if present)
  final _followFlag = GroupCode.followFlag(1);

  final _seqEnd = SeqEnd();

  @override
  set layer(LAYEREntry value) {
    super.layer = value;
    for (final vertex in vertices) {
      vertex.layer = value;
    }
    _seqEnd.layer = value;
  }

  @override
  String toString() {
    return '${GroupCode.type(name)}'
        '\n${GroupCode.layerName(layer)}'
        '\n$_followFlag'
        '\n$_dummyPoint'
        '\n${GroupCode.integer(70, flag ?? 0)}'
        '\n${vertices.nlJoin()}'
        '\n$_seqEnd';
  }
}

class Rectangle extends Polyline {
  Rectangle.fromLBRT(this.left, this.bottom, this.right, this.top)
      : super(
          vertices: [
            Vertex(x: left, y: bottom, z: 0),
            Vertex(x: left, y: top, z: 0),
            Vertex(x: right, y: top, z: 0),
            Vertex(x: right, y: bottom, z: 0),
          ],
          flag: 1,
        );

  Rectangle.fromLBWH(double left, double bottom, double width, double height)
      : this.fromLBRT(left, bottom, left + width, bottom + height);

  Rectangle.fromCircle({required Point center, required double radius})
      : this.fromCenter(
          center: center,
          width: radius * 2,
          height: radius * 2,
        );

  Rectangle.fromCenter(
      {required Point center, required double width, required double height})
      : this.fromLBRT(
          center.x - width / 2,
          center.y - height / 2,
          center.x + width / 2,
          center.y + height / 2,
        );

  Rectangle.fromPoints(Point a, Point b)
      : this.fromLBRT(
          math.min(a.x, b.x),
          math.min(a.y, b.y),
          math.max(a.x, b.x),
          math.max(a.y, b.y),
        );

  final double left;
  final double top;
  final double right;
  final double bottom;

  double get width => right - left;
  double get height => top - bottom;

  Point get topLeft => Point(left, top, elevation);
  Point get topCenter => Point(left + width / 2.0, top, elevation);
  Point get topRight => Point(right, top, elevation);
  Point get centerLeft => Point(left, bottom + height / 2.0, elevation);
  Point get center =>
      Point(left + width / 2.0, bottom + height / 2.0, elevation);
  Point get centerRight => Point(right, bottom + height / 2.0, elevation);
  Point get bottomLeft => Point(left, bottom, elevation);
  Point get bottomCenter => Point(left + width / 2.0, bottom, elevation);
  Point get bottomRight => Point(right, bottom, elevation);
}
