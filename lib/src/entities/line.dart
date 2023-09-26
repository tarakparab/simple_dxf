part of 'entity.dart';

class Line extends Entity {
  Line({
    required this.p1,
    required Point p2,
    this.scale = 1,
  })  : p2 = p2..pointIndex = 1,
        super(name: 'LINE');
        
  Point p1;
  Point p2;
  double scale; //TODO implement scale

  @override
  set layer(LAYEREntry value) {
    super.layer = value;
    p1.layer = value;
    p2.layer = value;
  }

  @override
  String toString() => '${GroupCode.type(name)}'
      '\n${GroupCode.layerName(layer)}'
      '\n$p1'
      '\n$p2';

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
