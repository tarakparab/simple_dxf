part of 'entity.dart';

class Insert extends Entity {
  Insert({
    required Block block,
    required this.insertionPoint,
  })  : _block = block,
        super(name: 'INSERT');

  final Block _block;
  final Point insertionPoint;

  @override
  String toString() => '${GroupCode.type(name)}'
      '\n${GroupCode.layerName(layer)}'
      '\n${GroupCode.name(_block.name)}'
      '\n$insertionPoint';
}
