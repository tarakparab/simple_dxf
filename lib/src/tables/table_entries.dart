part of 'table.dart';

abstract class TableEntry {
  const TableEntry();
}

class LineType extends TableEntry {
  const LineType(
      {required this.name,
      required this.descriptiveText,
      required this.elementLengths});

  final String name;
  final String descriptiveText;
  final List<double> elementLengths;

  GroupCode get _standardFlagValueCode => GroupCode.integer(70, 0);

  GroupCode get _alignmentCode => GroupCode.integer(72, 65);

  int get _nrOfLineTypeElements => elementLengths.length;

  double get _totalPatternLength => elementLengths.fold(
      0.0, (previousValue, element) => previousValue + element.abs());

  String get pattern => elementLengths
      .map((e) => GroupCode.repeatedDoublePrecisionFloat(e))
      .nlJoin();

  @override
  String toString() => '${GroupCode.type('LTYPE')}'
      '\n${GroupCode.name(name)}'
      '\n$_standardFlagValueCode'
      '\n${GroupCode.otherText(descriptiveText)}'
      '\n$_alignmentCode'
      '\n${GroupCode.integer(73, _nrOfLineTypeElements)}'
      '\n${GroupCode.doublePrecisionFloat(40, _totalPatternLength)}'
      '${_nrOfLineTypeElements != 0 ? '\n$pattern' : ''}';

  static const LineType continuous = LineType(
      name: 'CONTINUOUS', descriptiveText: 'Solid line', elementLengths: []);
}

class Layer extends TableEntry {
  final String name;
  final int color;
  final LineType lineType;

  const Layer(
      {required this.name,
      this.color = 7,
      this.lineType = LineType.continuous,
      this.flag});

  /// Standard flags (bit-coded values):
  /// - 1 = Layer is frozen; otherwise layer is thawed
  /// - 2 = Layer is frozen by default in new viewports
  /// - 4 = Layer is locked
  /// - 16 = If set, table entry is externally dependent on an xref
  /// - 32 = If both this bit and bit 16 are set, the externally dependent xref has been successfully resolved
  /// - 64 = If set, the table entry was referenced by at least one entity in the drawing the last time the drawing was edited. (This flag is for the benefit of AutoCAD commands. It can be ignored by most programs that read DXF files and need not be set by programs that write DXF files)
  final int? flag;

  @override
  String toString() => '${GroupCode.type('LAYER')}'
      '\n${GroupCode.name(name)}'
      '\n${GroupCode.flag(flag)}'
      '\n${GroupCode.aciColor(color)}'
      '\n${GroupCode.lineTypeName(lineType)}';

  static const zero = Layer(name: '0');
}
