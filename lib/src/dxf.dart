import 'sections/sections.dart';
import 'group_codes.dart';

class Dxf {
  Dxf({
    // required this.headerSection,
    // required this.classesSection,
    // required this.tablesSection,
    required this.blocksSection,
    required this.entitiesSection,
    // required this.objectsSection,
  });

  // final HeaderSection headerSection;
  // final ClassesSection classesSection; //TODO
  // final TablesSection tablesSection; //TODO
  final BlocksSection blocksSection; //TODO
  final EntitiesSection entitiesSection;
  // final ObjectsSection objectsSection; //TODO
  // final ThumbnailImageSection thumbnailImageSection; //TODO
  // final SummaryImageSection summaryImageSection; //TODO

  @override
  String toString() {
    final sections = Section.parseAllSections(
      // headerSection: headerSection,
      // classesSection: classesSection,
      // tablesSection: tablesSection,
      blocksSection: blocksSection,
      entitySection: entitiesSection,
      // objectsSection: objectsSection,
    );

    return sections.isEmpty
        ? ''
        : '$sections'
            '\n${GroupCode.type('EOF')}';
  }
}
