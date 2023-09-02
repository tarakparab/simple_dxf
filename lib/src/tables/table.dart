import '../group_codes.dart';
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
    return tableEntries.isEmpty
        ? ''
        : '${GroupCode.type('TABLE')}'
            '\n${GroupCode.name(name)}'
            '\n${GroupCode.integer(70, _nrOfEntries)}'
            '\n${tableEntries.nlJoin()}';
  }
}

class LineTypeTable extends Table<LineType> {
  LineTypeTable({required super.tableEntries}) : super(name: 'LTYPE');
}

class LayerTable extends Table<Layer> {
  LayerTable({required super.tableEntries}) : super(name: 'LAYER');
}
