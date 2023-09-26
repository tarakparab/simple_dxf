part of 'entity.dart';

class Text extends Entity {
  Text({
    required this.origin,
    required this.textHeight,
    required this.text,
  }) : super(name: 'TEXT');

  Point origin;
  double textHeight;
  String text;

  @override
  String toString() => '${GroupCode.type(name)}'
      '\n${GroupCode.layerName(layer)}'
      '\n$origin'
      '\n${GroupCode.doublePrecisionFloat(40, textHeight)}'
      '\n${GroupCode.primaryText(text)}';
}
