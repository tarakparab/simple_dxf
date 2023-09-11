part of 'sections.dart';

/// Contains the main drawing entities like lines, circles, arcs, text, and more.
class EntitiesSection extends Section<Entity> {
  EntitiesSection({List<Entity>? entities}) : super(name: 'ENTITIES') {
    if (entities.isNotNull) {
      for (final entity in entities!) {
        _contents.update(entity.hashCode, (value) => entity,
            ifAbsent: () => entity);
      }
    }
  }

  @override
  void add(Entity content) {
    _contents.update(
      content.hashCode,
      (value) => content,
      ifAbsent: () => content,
    );
  }
}
