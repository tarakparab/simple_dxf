part of 'sections.dart';

/// Contains various tables defining properties and styles.
class TablesSection extends Section<Table> {
  TablesSection({
    LTYPETable? lineTypeTable,
    STYLETable? layerTable,
  }) : super(name: 'TABLES') {
    _contents.addAll({
      LTYPETable: lineTypeTable,
      STYLETable: layerTable,
    });
  }
}
