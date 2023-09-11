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
  String toString() {
    return
        // TODO test
        // tableEntries.isEmpty
        // ? ''
        // :
        '${GroupCode.type('TABLE')}'
            '\n${GroupCode.name(name)}'
            '\n${GroupCode.integer(70, _nrOfEntries)}'
            '\n${tableEntries.nlJoin()}';
  }
}

class VPORTTable extends Table<VPORT> {
  VPORTTable({required super.tableEntries}) : super(name: 'VPORT');
}

class LTYPETable extends Table<LTYPE> {
  LTYPETable({required super.tableEntries}) : super(name: 'LTYPE');
}

class LAYERTable extends Table<LAYER> {
  LAYERTable({required super.tableEntries}) : super(name: 'LAYER') {
    // Default add
    tableEntries.add(LAYER.zero);
  }
}

class STYLETable extends Table<STYLE> {
  STYLETable({required super.tableEntries}) : super(name: 'STYLE') {
    // Default add
    tableEntries.add(STYLE.standard);
  }
}

class VIEWTable extends Table<VIEW> {
  VIEWTable({required super.tableEntries}) : super(name: 'VIEW') {}
}

class UCSTable extends Table<UCS> {
  UCSTable({required super.tableEntries}) : super(name: 'UCS') {}
}

class APPIDTable extends Table<APPID> {
  APPIDTable({required super.tableEntries}) : super(name: 'APPID') {
    // Default add
    tableEntries.add(APPID.acad);
  }
}

class DIMSTYLETable extends Table<DIMSTYLE> {
  DIMSTYLETable({required super.tableEntries}) : super(name: 'DIMSTYLE') {
    // Default add
    tableEntries.add(DIMSTYLE.standard);
  }
}

class BLOCKRECORDTable extends Table<BLOCKRECORD> {
  BLOCKRECORDTable({required super.tableEntries})
      : super(name: 'BLOCK_RECORD') {}
}
