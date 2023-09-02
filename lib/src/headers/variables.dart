import '../group_codes.dart';

/// [Autodesk DXF Reference > DXF Format > About the DXF HEADER Section](https://help.autodesk.com/view/OARX/2018/ENU/?guid=GUID-28FA4CFB-9D5E-4880-9F11-36C97578252F)
/// > The HEADER section of a DXF file contains the settings of variables
/// associated with the drawing. Each variable is specified by a 9 group code
/// giving the variable's name, followed by groups that supply the variable's
/// value. Only the variables that are saved in the drawing file are listed.
abstract class Variable {
  final String name;
  GroupCode valueCode;

  Variable({
    required String name,
    required this.valueCode,
  }):name = '\$$name';

  @override
  String toString() => '${GroupCode.string(9, name)}'
      '\n$valueCode';
}

class InsUnits extends Variable {
  InsUnits._({required int value})
      : super(
          name: 'INSUNITS',
          valueCode: GroupCode.integer(70, value),
        );

  static final unspecified = InsUnits._(value: 0);
  static final inches = InsUnits._(value: 1);
  static final feet = InsUnits._(value: 2);
  static final miles = InsUnits._(value: 3);
  static final millimeters = InsUnits._(value: 4);
  static final centimeters = InsUnits._(value: 5);
  static final meters = InsUnits._(value: 6);
  static final kilometers = InsUnits._(value: 7);
  static final microinches = InsUnits._(value: 8);
  static final mils = InsUnits._(value: 9);
  static final yards = InsUnits._(value: 10);
  static final angstroms = InsUnits._(value: 11);
  static final nanometers = InsUnits._(value: 12);
  static final microns = InsUnits._(value: 13);
  static final decimeters = InsUnits._(value: 14);
  static final dekameters = InsUnits._(value: 15);
  static final hectometers = InsUnits._(value: 16);
  static final gigameters = InsUnits._(value: 17);
  static final astronomical = InsUnits._(value: 18);
  static final lightYears = InsUnits._(value: 19);
  static final parsecs = InsUnits._(value: 20);
  static final usSurveyFeet = InsUnits._(value: 21);
}
