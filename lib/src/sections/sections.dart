import '../entities/entity.dart';
import '../group_codes.dart';
import '../headers/variables.dart';
import '../tables/table.dart';
import '../utils/extensions.dart';

abstract class Section<T> {
  Section({required this.name});

  String name;
  final Map<dynamic, T?> _contents = {};

  void add(T content) {
    _contents.update(
      content.runtimeType,
      (value) => content,
      ifAbsent: () => content,
    );
  }

  void addAll(List<T> contents) {
    for (final content in contents) {
      add(content);
    }
  }

  final _sectionStart = GroupCode.type('SECTION');
  final _sectionEnd = GroupCode.type('ENDSEC');

  String _parseSection() {
    final sanitisedList = _contents.values
        .where((element) => element.isNotNull)
        .map((e) => '$e')
        .where((element) => element.isNotEmpty)
        .toList();

    if (sanitisedList.isEmpty) return '';

    final entries = sanitisedList.nlJoin();

    return '$_sectionStart'
        '\n${GroupCode.name(name)}'
        '\n$entries'
        '\n$_sectionEnd';
  }

  static String parseAllSections({
    // required HeaderSection headerSection,
    // required TablesSection tablesSection,
    required EntitiesSection entitySection,
  }) {
    // TODO String headerContent = headerSection._parseSection();
    // TODO String tableContent = tablesSection._parseSection();
    String entityContent = entitySection._parseSection();

    List<String> sections = [
      // TODO if (headerContent.isNotEmpty) headerContent,
      // TODO if (tableContent.isNotEmpty) tableContent,
      if (entityContent.isNotEmpty) entityContent,
    ];

    return sections.nlJoin();
  }
}

class HeaderSection extends Section<Variable> {
  HeaderSection({InsUnits? insUnits}) : super(name: 'HEADER') {
    _contents.addAll({InsUnits: insUnits});
  }
}

class TablesSection extends Section<Table> {
  TablesSection({
    LineTypeTable? lineTypeTable,
    LayerTable? layerTable,
  }) : super(name: 'TABLES') {
    _contents.addAll({
      LineTypeTable: lineTypeTable,
      LayerTable: layerTable,
    });
  }
}

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
