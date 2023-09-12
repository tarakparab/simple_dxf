// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'entity.dart';

class Line extends Entity {
  Point p1;
  Point p2;
  double scale; //TODO implement scale

  @override
  set layer(LAYEREntry value) {
    super.layer = value;
    p1.layer = value;
    p2.layer = value;
  }

  Line({
    required Point p2,
    required this.p1,
    required this.scale,
  })  : p2 = p2..pointIndex = 1,
        super(name: 'LINE');

  @override
  String toString() => '${GroupCode.type(name)}'
      '\n${GroupCode.layerName(layer)}'
      '\n$p1'
      '\n$p2';
}
