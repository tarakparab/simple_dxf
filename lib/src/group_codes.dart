import 'package:simple_dxf/src/tables/table.dart';

import 'utils/string.dart';

class GroupCode {
  const GroupCode(this.code, this.value);

  final String code;
  final String value;

  @override
  String toString() => '$code'
      '\n$value';

  // Value Types
  /// 2049 single-byte characters not including the newline at the end of the line
  static GroupCode string(int code, String value) {
    assert(code >= 0 || code <= 9);
    return GroupCode('  $code', value);
  }

  static GroupCode _integer16bit(int code, int value) {
    assert(code >= 60 || code <= 79);
    return GroupCode(' $code', '${spaces(5)}$value');
  }

  // static GroupCode _integer32bit(int code, int value) {
  //   assert(code >= 90 || code <= 99);
  //   return GroupCode(' $code', '${spaces(5)}$value');
  // }

  static GroupCode _double(int code, double value) {
    assert(code >= 40 || code <= 59);
    return GroupCode(' $code', '$value');
  }

  // Specific types
  static GroupCode type(String name) => string(0, name);
  static GroupCode name(String value) => string(2, value);

  static GroupCode otherText(String value, {int code = 3}) {
    assert(code == 3 || code == 4);
    return string(code, value);
  }

  static GroupCode lineTypeName(LineType lineType) => string(6, lineType.name);

  static GroupCode layerName(Layer layer) => string(8, layer.name);

  static GroupCode doublePrecision3DPointValue(int code, double value) {
    assert(code >= 10 || code <= 39);
    return _double(code, value);
  }

  /// Double-precision floating-point values (text height, scale factors, and so on)
  ///
  /// 48 Linetype scale; double precision floating point scalar value;
  /// default value is defined for all entity types
  static GroupCode doublePrecisionFloat(int code, double value) {
    assert(code >= 40 || code <= 48);
    return _double(code, value);
  }

  static GroupCode repeatedDoublePrecisionFloat(double value) {
    return _double(49, value);
  }

  static aciColor(int value) => _integer16bit(62, value);

  // Flags
  /// [Autodesk DXF Reference > Entities Section > INSERT](https://help.autodesk.com/view/OARX/2018/ENU/?guid=GUID-28FA4CFB-9D5E-4880-9F11-36C97578252F)
  /// > Variable attributes-follow flag (optional; default = 0); if the value of
  /// attributes-follow flag is 1, a series of attribute entities is expected
  /// to follow the insert, terminated by a seqend entity.
  static GroupCode followFlag(int value) => _integer16bit(66, value);


  static GroupCode flag(int? value) => _integer16bit(70, value ?? 0);

  /// 70-78 Integer values, such as repeat counts, flag bits, or modes
  static GroupCode integer(int code, int value) {
    assert(code >= 70 || code <= 78);
    return _integer16bit(code, value);
  }

  /// Subclass data marker (with derived class name as a string).
  static GroupCode subclassDataMarker(String value) => GroupCode('100', value);
}
