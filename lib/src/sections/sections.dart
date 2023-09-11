import '../entities/entity.dart';
import '../group_codes.dart';
import '../headers/variables.dart';
import '../tables/table.dart';
import '../utils/extensions.dart';

part 'header_section.dart';
part 'classes_section.dart';
part 'tables_section.dart';
part 'blocks_section.dart';
part 'entities_section.dart';
part 'objects_section.dart';

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

    // if (sanitisedList.isEmpty) return '';

    final entries = sanitisedList.nlJoin();

    return '$_sectionStart'
        '\n${GroupCode.name(name)}'
        '\n$entries'
        '\n$_sectionEnd';
  }

  static String parseAllSections({
    required HeaderSection headerSection,
    required ClassesSection classesSection,
    required TablesSection tablesSection,
    required BlocksSection blocksSection,
    required EntitiesSection entitySection,
    required ObjectsSection objectsSection,
  }) {
    String headerContent = headerSection._parseSection();
    String classesContent = classesSection._parseSection();
    String tablesContent = tablesSection._parseSection();
    String blocksContent = blocksSection._parseSection();
    String entityContent = entitySection._parseSection();
    String objectsContent = objectsSection._parseSection();

    List<String> sections = [
      if (headerContent.isNotEmpty) headerContent,
      if (classesContent.isNotEmpty) classesContent,
      if (tablesContent.isNotEmpty) tablesContent,
      if (blocksContent.isNotEmpty) blocksContent,
      if (entityContent.isNotEmpty) entityContent,
      if (objectsContent.isNotEmpty) objectsContent,
    ];

    return sections.nlJoin();
  }
}
