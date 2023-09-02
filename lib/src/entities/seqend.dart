part of 'entity.dart';

class SeqEnd extends Entity {
  SeqEnd() : super(name: 'SEQEND');

  @override
  String toString() => '${GroupCode.type(name)}'
      '\n${GroupCode.layerName(layer)}';
}
