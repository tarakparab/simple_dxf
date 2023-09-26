import '../group_codes.dart';
import '../headers/variables.dart';
import '../utils/extensions.dart';

part 'table_entries.dart';

abstract class Table<T extends TableEntry> {
  Table({
    required this.name,
    required this.tableEntries,
  });

  String name;
  List<T> tableEntries;

  int get _nrOfEntries => tableEntries.length;

  @override
  String toString() => '${GroupCode.type('TABLE')}'
            '\n${GroupCode.name(name)}'
            '\n${GroupCode.integer(70, _nrOfEntries)}'
            '\n${tableEntries.nlJoin()}';
}

class VPORTTable extends Table<Vport> {
  VPORTTable({required super.tableEntries}) : super(name: 'VPORT');
}

class LTYPETable extends Table<LTYPEEntry> {
  LTYPETable({required super.tableEntries}) : super(name: 'LTYPE');
}

class LAYERTable extends Table<LAYEREntry> {
  LAYERTable({required super.tableEntries}) : super(name: 'LAYER') {
    // Default add
    tableEntries.add(LAYEREntry.zero);
  }
}

class STYLETable extends Table<STYLEEntry> {
  STYLETable({required super.tableEntries}) : super(name: 'STYLE') {
    // Default add
    tableEntries.add(STYLEEntry.standard);
  }
}

class VIEWTable extends Table<VIEWEntry> {
  VIEWTable({required super.tableEntries}) : super(name: 'VIEW') {}
}

class UCSTable extends Table<UCSEntry> {
  UCSTable({required super.tableEntries}) : super(name: 'UCS') {}
}

class APPIDTable extends Table<APPIDEntry> {
  APPIDTable({required super.tableEntries}) : super(name: 'APPID') {
    // Default add
    tableEntries.add(APPIDEntry.acad);
  }
}

class DIMSTYLETable extends Table<DIMSTYLEEntry> {
  DIMSTYLETable({required super.tableEntries}) : super(name: 'DIMSTYLE') {
    // Default add
    // tableEntries.add(DIMSTYLE.standard);
  }
}

class BLOCKRECORDTable extends Table<BLOCKRECORDEntry> {
  BLOCKRECORDTable({required super.tableEntries})
      : super(name: 'BLOCK_RECORD') {}
}
