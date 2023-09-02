part of 'entity.dart';

class Line extends Entity {
  Point p1;
  Point p2;

  @override
  set layer(Layer value) {
    super.layer = value;
    p1.layer = value;
    p2.layer = value;
  }

  Line({
    required this.p1,
    required Point p2,
  })  : p2 = p2..pointIndex = 1,
        super(name: 'LINE');

  @override
  String toString() => '${GroupCode.type(name)}'
      '\n${GroupCode.layerName(layer)}'
      '\n$p1'
      '\n$p2';
}
