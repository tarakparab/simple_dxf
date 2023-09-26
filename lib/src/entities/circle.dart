part of 'entity.dart';

class Circle extends Entity {
  Circle.radius({
    required this.origin,
    required this.radius,
  }) : super(name: 'CIRCLE');

  Circle.diameter({
    required Point origin,
    required double diameter,
  }) : this.radius(origin: origin, radius: diameter / 2);

  Point origin;
  double radius;

  @override
  set layer(LAYEREntry value) {
    super.layer = value;
    origin.layer = value;
  }

  @override
  String toString() => '${GroupCode.type(name)}'
      '\n${GroupCode.layerName(layer)}'
      '\n$origin'
      '\n${GroupCode.doublePrecisionFloat(40, radius)}';
}
