part of 'table.dart';

/// {@template standard_flag_values}
/// - 16 = If set, table entry is externally dependent on an xref
/// - 32 = If both this bit and bit 16 are set, the externally dependent xref
/// has been successfully resolved
/// - 64 = If set, the table entry was referenced by at least one entity in
/// the drawing the last time the drawing was edited. (This flag is for the
/// benefit of AutoCAD commands. It can be ignored by most programs that read
///  DXF files and need not be set by programs that write DXF files)
/// {@endtemplate}

abstract class TableEntry {
  final String name;
  const TableEntry({required this.name});

  @override
  String toString() => '${GroupCode.type(runtimeType.toString())}'
      '\n${GroupCode.name(name)}';
}

//    VPORT entry *ACTIVE is not required! Empty table is ok for AutoCAD.
class VPORT extends TableEntry {
  VPORT({
    required super.name,
  });
}

//    LTYPE with at least the following line types defined:
//        BYBLOCK
//        BYLAYER
//        CONTINUOUS
class LTYPE extends TableEntry {
  const LTYPE({
    required super.name,
    required this.descriptiveText,
    required this.elementLengths,
  });

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
  String toString() => '${super}'
      '\n$_standardFlagValueCode'
      '\n${GroupCode.otherText(descriptiveText)}'
      '\n$_alignmentCode'
      '\n${GroupCode.integer(73, _nrOfLineTypeElements)}'
      '\n${GroupCode.doublePrecisionFloat(40, _totalPatternLength)}'
      '${_nrOfLineTypeElements != 0 ? '\n$pattern' : ''}';

  static const LTYPE byBlock = LTYPE(
      name: 'BYBLOCK', descriptiveText: '', elementLengths: []); //TODO test

  static const LTYPE byLayer = LTYPE(
      name: 'BYLAYER', descriptiveText: '', elementLengths: []); //TODO test

  static const LTYPE continuous = LTYPE(
      name: 'CONTINUOUS', descriptiveText: 'Solid line', elementLengths: []);
}

//    LAYER with at least an entry for layer ‘0’
class LAYER extends TableEntry {
  final int color;
  final LTYPE lineType;

  const LAYER({
    required super.name,
    this.color = 7,
    this.lineType = LTYPE.continuous,
    this.flag,
  });

  /// Standard flags (bit-coded values):
  /// - 1 = Layer is frozen; otherwise layer is thawed
  /// - 2 = Layer is frozen by default in new viewports
  /// - 4 = Layer is locked
  /// {@macro standard_flag_values}
  final int? flag;

  @override
  String toString() => '${super}'
      '\n${GroupCode.integer(70, flag ?? 0)}'
      '\n${GroupCode.aciColorNr(color)}'
      '\n${GroupCode.lineTypeName(lineType)}';

  static const zero = LAYER(name: '0');
}

//    STYLE with at least an entry for style STANDARD
class STYLE extends TableEntry {
  const STYLE({
    required super.name,
    required this.textHeight,
    required this.widthFactor,
    required this.obliqueAngle,
    this.standardFlag,
    this.textGenerationFlag,
    required this.lastHeightUsed,
    required this.primaryFontFileName,
    this.bigFontFileName,
  });

  /// Standard flag values (bit-coded values)
  /// - 1 = If set, this entry describes a shape
  /// - 4 = Vertical text
  /// {@macro standard_flag_values}
  final int? standardFlag;

  final double textHeight;
  final double widthFactor;
  final double obliqueAngle;

  /// Text generation flags
  /// - 2 = Text is backward (mirrored in X)
  /// - 4 = Text is upside down (mirrored in Y)
  final int? textGenerationFlag;

  final double lastHeightUsed;

  final String primaryFontFileName;
  final String? bigFontFileName;

  @override
  String toString() => '${super}'
      '\n${GroupCode.integer(70, standardFlag ?? 0)}'
      '\n${GroupCode.doublePrecisionFloat(40, textHeight)}'
      '\n${GroupCode.doublePrecisionFloat(41, widthFactor)}'
      '\n${GroupCode.angle(50, obliqueAngle)}'
      '\n${GroupCode.integer(70, textGenerationFlag ?? 0)}'
      '\n${GroupCode.doublePrecisionFloat(42, lastHeightUsed)}'
      '\n${GroupCode.otherText(primaryFontFileName)}'
      '\n${GroupCode.otherText(code: 4, bigFontFileName ?? '')}';

  static const standard = STYLE(
    name: 'STANDARD',
    textHeight: 0,
    widthFactor: 1,
    obliqueAngle: 0,
    lastHeightUsed: 0.2,
    primaryFontFileName: 'txt',
  );
}

//    VIEW can be empty
class VIEW extends TableEntry {
  const VIEW({required super.name});
  // TODO
}

//    UCS can be empty
class UCS extends TableEntry {
  const UCS({required super.name});
  // TODO
}

//    APPID with at least an entry for ACAD
class APPID extends TableEntry {
  const APPID({
    required super.name,
    this.standardFlag,
  });

  /// {@macro standard_flag_values}
  final int? standardFlag;

  @override
  String toString() => '${super}'
      '\n${GroupCode.integer(70, standardFlag ?? 0)}';

  static const acad = APPID(name: 'ACAD');
}

//    DIMSTYLE with at least an entry for style STANDARD
class DIMSTYLE extends TableEntry {
  const DIMSTYLE({
    required super.name,
    this.standardFlag,
    this.prefixOrSuffix,
    this.prefixOrSuffixAltDim,
    this.arrowHeadsBoth = ArrowHeadBlocks.closedFilled,
    this.arrowHeadFirst = ArrowHeadBlocks.closedFilled,
    this.arrowHeadSecond = ArrowHeadBlocks.closedFilled,
    this.scale = 1,
    required this.arrowSize,
    required this.extensionLineOffset,
    required this.dimensionLineIncrement,
  });

  /// {@macro standard_flag_values}
  final int? standardFlag;

  /// {@macro DIMPOST}
  final String? prefixOrSuffix;

  /// {@macro DIMAPOST}
  final String? prefixOrSuffixAltDim;

  final ArrowHeadBlocks arrowHeadsBoth;
  final ArrowHeadBlocks arrowHeadFirst;
  final ArrowHeadBlocks arrowHeadSecond;

  /// {@macro DIMSCALE}
  final double scale;

  /// {@macro DIMASZ}
  final double arrowSize;

  /// {@macro DIMEXO}
  final double extensionLineOffset;

  /// {@macro DIMDLI}
  final double dimensionLineIncrement;

  @override
  String toString() => '${super}'
      '\n${GroupCode.integer(70, standardFlag ?? 0)}'
      '\n${GroupCode.otherText(prefixOrSuffix ?? '')}'
      '\n${GroupCode.otherText(prefixOrSuffixAltDim ?? '')}'
      '\n${GroupCode.string(5, arrowHeadsBoth.id)}'
      '\n${GroupCode.string(6, arrowHeadFirst.id)}'
      '\n${GroupCode.string(7, arrowHeadSecond.id)}'
      '\n${GroupCode.doublePrecisionFloat(40, scale)}'
      '\n${GroupCode.doublePrecisionFloat(41, arrowSize)}'
      '\n${GroupCode.doublePrecisionFloat(42, extensionLineOffset)}'
      '\n${GroupCode.doublePrecisionFloat(
        43,
      )}'
      '\n${GroupCode.doublePrecisionFloat(
        44,
      )}'
      '\n${GroupCode.doublePrecisionFloat(
        45,
      )}'
      '\n${GroupCode.doublePrecisionFloat(
        46,
      )}'
      '\n${GroupCode.doublePrecisionFloat(
        47,
      )}'
      '\n${GroupCode.doublePrecisionFloat(
        48,
      )}'
      '\n${GroupCode.angle(50, obliqueAngle)}'
      '\n${GroupCode.integer(70, textGenerationFlag ?? 0)}'
      '\n${GroupCode.doublePrecisionFloat(42, lastHeightUsed)}'
      '\n${GroupCode.otherText(code: 4, bigFontFileName ?? '')}';

  static const standard = STYLE(
    name: 'STANDARD',
    textHeight: 0,
    widthFactor: 1,
    obliqueAngle: 0,
    lastHeightUsed: 0.2,
    primaryFontFileName: 'txt',
  );
}

//    BLOCK_RECORD with two entries:
//        *MODEL_SPACE
//        *PAPER_SPACE
class BLOCKRECORD extends TableEntry {
  const BLOCKRECORD({required super.name});
  // TODO
}
