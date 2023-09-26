part of 'sections.dart';

/// Contains block definitions that can be inserted into the drawing.
class BlocksSection extends Section<Block> {
  BlocksSection({List<Block>? blocks}) : super(name: 'BLOCKS') {
    if (blocks.isNotNull) {
      for (final block in blocks!) {
        _contents.update(block.hashCode, (value) => block,
            ifAbsent: () => block);
      }
    }
  }

  @override
  void add(Block content) {
    _contents.update(
      content.hashCode,
      (value) => content,
      ifAbsent: () => content,
    );
  }
}
