import 'sections/sections.dart';
import 'group_codes.dart';

class Dxf {
  Dxf({
    // required this.headerSection,
    // required this.tablesSection,
    required this.entitiesSection,
  });

  // final HeaderSection headerSection; TODO
  // final ClassesSection classesSection; TODO
  // final TablesSection tablesSection; TODO
  // final BlocksSection blocksSection; TODO
  final EntitiesSection entitiesSection;
  // final ObjectsSection objectsSection; TODO
  // final ThumbnailImageSection thumbnailImageSection; TODO
  // final SummaryImageSection summaryImageSection; TODO

  @override
  String toString() {
    final sections = Section.parseAllSections(
      // headerSection: headerSection,
      // tablesSection: tablesSection,
      entitySection: entitiesSection,
    );

    return sections.isEmpty
        ? ''
        : '$sections'
            '\n${GroupCode.type('EOF')}';
  }
}
