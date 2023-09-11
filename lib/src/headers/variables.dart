import 'package:simple_dxf/src/utils/extensions.dart';

import '../group_codes.dart';
import '../tables/table.dart';

/// [Autodesk DXF Reference > DXF Format > About the DXF HEADER Section](https://help.autodesk.com/view/OARX/2024/ENU/?guid=GUID-EA9CDD11-19D1-4EBC-9F56-979ACF679E3C)
/// > The HEADER section of a DXF file contains the settings of variables
/// associated with the drawing. Each variable is specified by a 9 group code
/// giving the variable's name, followed by groups that supply the variable's
/// value. Only the variables that are saved in the drawing file are listed.
abstract class Variable {
  final String name;
  final List<GroupCode> valueCodes;

  const Variable(
    String name,
    this.valueCodes,
  ) : name = '\$$name';

  @override
  String toString() => '${GroupCode.string(9, name)}'
      '\n${valueCodes.nlJoin()}';
}

/// The AutoCAD drawing database version number
class ACADVER extends Variable {
  ACADVER._(int value)
      : super(
          'ACADVER',
          [GroupCode.string(1, 'AC$value')],
        );

  /// AC1006
  static final r10 = ACADVER._(1006);

  /// AC1009
  static final r11_12 = ACADVER._(1009);

  /// AC1012
  static final r13 = ACADVER._(1012);

  /// AC1014
  static final r14 = ACADVER._(1014);

  /// AC1015
  static final r2000 = ACADVER._(1015);

  /// AC1018
  static final r2004 = ACADVER._(1018);

  /// AC1021
  static final r2007 = ACADVER._(1021);

  /// AC1024
  static final r2010 = ACADVER._(1024);

  /// AC1027
  static final r2013 = ACADVER._(1027);

  /// AC1032
  static final r2018 = ACADVER._(1032);
}

/// Angle 0 direction
class ANGBASE extends Variable {
  ANGBASE(double value)
      : super(
          'ANGBASE',
          [GroupCode.angle(50, value)],
        );
}

/// 1 = Clockwise angles
/// 0 = Counterclockwise angles
class ANGDIR extends Variable {
  ANGDIR._(int value)
      : assert(value == 0 || value == 1),
        super(
          'ANGDIR',
          [GroupCode.integer(70, value)],
        );

  static final clockwise = ANGDIR._(0);
  static final counterClockwise = ANGDIR._(1);
}

/// [ATTDIA (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-DD7AE7D3-D9D7-49E7-948E-079D8451FFA2)
///
/// Controls whether the INSERT command uses a dialog box for attribute value entry.
/// - Type:	Integer
/// - Saved in:	Registry
/// - Initial value:	1
///
/// - 0       Issues Command prompts
/// - 1       Uses a dialog box
class ATTDIA extends Variable {
  ATTDIA._(int value)
      : assert(value == 0 || value == 1),
        super(
          'ATTDIA',
          [GroupCode.integer(70, value)],
        );
  static final issueCommandPrompt = ATTDIA._(0);
  static final useDialogBox = ATTDIA._(1);
}

/// Attribute visibility:
/// - 0 = None
/// - 1 = Normal
/// - 2 = All
class ATTMODE extends Variable {
  ATTMODE._(int value)
      : assert(value == 0 || value == 1),
        super(
          'ATTMODE',
          [GroupCode.integer(70, value)],
        );

  static final none = ATTMODE._(0);
  static final normal = ATTMODE._(1);
  static final all = ATTMODE._(2);
}

/// Controls whether INSERT uses default attribute settings during insertion of blocks.
/// - Type: Integer
/// - Saved in: Registry
/// - Initial value: 1
/// - 0 Assumes the defaults for the values of all attributes
/// - 1 Turns on prompts or a dialog box for attribute values, as specified by ATTDIA
class ATTREQ extends Variable {
  ATTREQ._(int value)
      : assert(value == 0 || value == 1),
        super(
          'ATTREQ',
          [GroupCode.integer(70, value)],
        );
  static final assumeDefaults = ATTREQ._(0);
  static final promptForAttributeValues = ATTREQ._(1);
}

/// [AUNITS (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-C7C0F6A5-7982-43DB-97F9-5B9B0044E9FA)
///
/// Sets units for angles.
///	- Type: 	Integer
///	- Saved in: 	Drawing
///	- Initial value: 	0
///	- 0: Decimal degrees
///	- 1: Degrees/minutes/seconds
///	- 2: Gradians
///	- 3: Radians
///	- 4: Surveyor's units
class AUNITS extends Variable {
  AUNITS._(int value)
      : super(
          'AUNITS',
          [GroupCode.integer(70, value)],
        );

  static final decimalDegrees = AUNITS._(0);
  static final degreesMinutesSeconds = AUNITS._(0);
  static final gradians = AUNITS._(0);
  static final radians = AUNITS._(0);
  static final surveyorsUnits = AUNITS._(0);
}

/// Units precision for angles
class AUPREC extends Variable {
  AUPREC(int value)
      : super(
          'AUPREC',
          [GroupCode.integer(70, value)],
        );
}

/// [AutoCAD .BLIPMODE: Non-permanent visual Reference Points](https://forums.autodesk.com/t5/autodesk-community-tips-autocad/autocad-blipmode-non-permanent-visual-reference-points/ta-p/11789278)
///
/// Controls the display of marker blips.
/// When Blip mode is on, a temporary mark in the shape of a plus sign (+) appears where you specify a point. BLIPMODE is off by default.
class BLIPMODE extends Variable {
  BLIPMODE._(int value)
      : assert(value == 0 || value == 1),
        super(
          'BLIPMODE',
          [GroupCode.integer(70, value)],
        );

  static final off = BLIPMODE._(0);
  static final on = BLIPMODE._(1);
}

/// Current entity color number
/// - 0 = BYBLOCK
/// - 256 = BYLAYER
class CECOLOR extends Variable {
  CECOLOR(int value)
      : assert(value >= 0 && value <= 256),
        super(
          'CECOLOR',
          [GroupCode.aciColorNr(value)],
        );

  static final byBlock = CECOLOR(0);
  static final byLayer = CECOLOR(256);
}

/// Entity linetype name, or BYBLOCK or BYLAYER
class CELTYPE extends Variable {
  CELTYPE(LTYPE value)
      : super(
          'CELTYPE',
          [GroupCode.lineTypeName(value)],
        );
}

/// First chamfer distance
class CHAMFERA extends Variable {
  CHAMFERA(double value)
      : super(
          'CHAMFERA',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Second chamfer distance
class CHAMFERB extends Variable {
  CHAMFERB(double value)
      : super(
          'CHAMFERB',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Current layer name
class CLAYER extends Variable {
  CLAYER(LAYER value)
      : super(
          'CLAYER',
          [GroupCode.layerName(value)],
        );
}

/// [COORDS (System Variable)](https://help.autodesk.com/view/ACD/2023/ENU/?guid=GUID-91D3C93C-9C89-4397-B855-92AFD5228422)
///
/// Controls whether the cursor position on the status bar is updated continuously or at specific times only. It also controls the format in which the coordinates are displayed.
/// - Type: 	Integer
/// - Saved in: 	Registry
/// - Initial value: 	1
/// - 0: Absolute coordinates are displayed; the coordinate display is updated only when a point is specified.
/// - 1: Absolute coordinates are displayed; the coordinate display is updated continuously in realtime.
/// - 2: Relative polar coordinates are displayed when a command is active and while you specify a point, distance, or an angle; the coordinate display is updated continuously in realtime. When a command is not active, absolute coordinate values are displayed. Note: Z values are always in absolute coordinates.
/// - 3: Geographic (latitude and longitude) coordinates are displayed; the coordinate display is updated continuously in realtime. The coordinate format is controlled by the GEOLATLONGFORMAT system variable. Note: Z values are not displayed when the drawing file contains geographic location information.
class COORDS extends Variable {
  COORDS._(int value)
      : assert(value >= 0 && value <= 3),
        super(
          'COORDS',
          [GroupCode.integer(70, value)],
        );
  static final absCoords = COORDS._(0);
  static final absCoordsRealtime = COORDS._(1);
  static final relativePolarCoords = COORDS._(2);
  static final geoCoords = COORDS._(3);
}

/// Alternate unit dimensioning performed if nonzero
///
/// [DIMALT (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-D3B737AB-53B7-431E-A794-746DD2EB6209)
///
/// Controls the display of alternate units in dimensions.
///	- Type:	Switch
///	- Saved in:	Drawing
///	- Initial value:	0
///	- 0: Disables alternate units
///	- 1: Enables alternate units
class DIMALT extends Variable {
  DIMALT._(int value)
      : super(
          'DIMALT',
          [GroupCode.integer(70, value)],
        );

  static final disableAlternatUnits = DIMALT._(0);
  static final enableAlternatUnits = DIMALT._(1);
}

/// Alternate unit decimal places
class DIMALTD extends Variable {
  DIMALTD(int value)
      : super(
          'DIMALTD',
          [GroupCode.integer(70, value)],
        );
}

/// Alternate unit scale factor
class DIMALTF extends Variable {
  DIMALTF(double value)
      : super(
          'DIMALTF',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// {@template DIMAPOST}
/// Alternate dimensioning suffix
///
/// [DIMAPOST (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-AEA9448D-CC01-404B-AFA0-055B9C2F21EE)
///
/// Specifies a text prefix or suffix (or both) to the alternate dimension
/// measurement for all types of
/// - dimensions except angular.
/// - Type:	String 1
/// - Saved in:	Drawing
/// - Initial value:	""
/// - For instance, if the current units are Architectural, DIMALT is on,
/// DIMALTF is 25.4 (the number of millimeters per inch), DIMALTD is 2, and
/// DIMAPOST is set to "mm", a distance of 10 units would be displayed as
/// 10"[254.00mm].
/// - To turn off an established prefix or suffix (or both), set it to a single
///  period (.).
/// {@endtemplate}
class DIMAPOST extends Variable {
  DIMAPOST(String value)
      : super(
          'DIMAPOST',
          [GroupCode.primaryText(value)],
        );
}

///- 1 = Create associative dimensioning
///- 0 = Draw individual entities
///
/// Note: Obsolete; see $DIMASSOC.
class DIMASO extends Variable {
  DIMASO._(int value)
      : super(
          'DIMASO',
          [GroupCode.integer(70, value)],
        );
  static final createAssociativeDimensioning = DIMASO._(0);
  static final drawIndividualEntities = DIMASO._(1);
}

/// {@template DIMASZ}
/// Dimensioning arrow size
/// 
/// [DIMASZ (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-43E31690-BA17-4AD6-82D1-E7809BD1298A)
/// 
/// Controls the size of dimension line and leader line arrowheads. Also 
/// controls the size of hook lines.
/// - Type:	Real
/// - Saved in:	Drawing
/// - Initial value:	0.1800 (imperial) or 2.5000 (metric)
/// - Multiples of the arrowhead size determine whether dimension lines and text
/// should fit between the extension lines. DIMASZ is also used to scale 
/// arrowhead blocks if set by DIMBLK. DIMASZ has no effect when DIMTSZ is other
/// than zero.
/// {@endtemplate}
class DIMASZ extends Variable {
  DIMASZ(double value)
      : super(
          'DIMASZ',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// {@template DIMBLK}
/// Arrow block name
///
/// [DIMBLK (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-6E09DCCA-313F-4FF4-BB1B-F41B512B9CC9)
///
/// Sets the arrowhead block displayed at the ends of dimension lines.
/// - Type:	String 1
/// - Saved in:	Drawing
/// - Initial value:	""
///
/// To return to the default, closed-filled arrowhead display, enter a single
/// period (.). Arrowhead block entries and the names used to select them in the
/// New, Modify, and Override Dimension Style dialog boxes are shown below.
/// You can also enter the names of user-defined arrowhead blocks.
///
/// Note: Annotative blocks cannot be used as custom arrowheads for
/// dimensions or leaders.
/// {@endtemplate}
class DIMBLK extends Variable {
  DIMBLK._(ArrowHeadBlocks value)
      : super(
          'DIMBLK',
          [GroupCode.primaryText(value.id)],
        );
}

enum ArrowHeadBlocks {
  closedFilled(''),
  dot('_DOT'),
  dotSmall('_DOTSMALL'),
  dotBlank('_DOTBLANK'),
  originIndicator('_ORIGIN'),
  originIndicator2('_ORIGIN2'),
  open('_OPEN'),
  rightAngle('_OPEN90'),
  open30('_OPEN30'),
  closed('_CLOSED'),
  dotSmallBlank('_SMALL'),
  none('_NONE'),
  oblique('_OBLIQUE'),
  boxFilled('_BOXFILLED'),
  box('_BOXBLANK'),
  closedBlank('_CLOSEDBLANK'),
  datumTriangleFilled('_DATUMFILLED'),
  datumTriangle('_DATUMBLANK'),
  integral('_INTEGRAL'),
  architecturalTick('_ARCHTICK'),
  ;

  final String id;
  const ArrowHeadBlocks(this.id);
}

/// First arrow block name
class DIMBLK1 extends Variable {
  DIMBLK1(String value)
      : super(
          'DIMBLK1',
          [GroupCode.primaryText(value)],
        );
  static final defaultValue = DIMBLK1('');
}

/// Second arrow block name
class DIMBLK2 extends Variable {
  DIMBLK2(String value)
      : super(
          'DIMBLK2',
          [GroupCode.primaryText(value)],
        );
  static final defaultValue = DIMBLK2('');
}

/// Size of center mark/lines
class DIMCEN extends Variable {
  DIMCEN(double value)
      : super(
          'DIMCEN',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Dimension line color
/// - 0 = BYBLOCK
/// - 256 = BYLAYER
class DIMCLRD extends Variable {
  DIMCLRD(int value)
      : super(
          'DIMCLRD',
          [GroupCode.integer(70, value)],
        );
  static final byBlock = DIMCLRD(0);
  static final byLayer = DIMCLRD(256);
}

/// Dimension extension line color
/// - 0 = BYBLOCK
/// - 256 = BYLAYER
class DIMCLRE extends Variable {
  DIMCLRE(int value)
      : super(
          'DIMCLRE',
          [GroupCode.integer(70, value)],
        );
  static final byBlock = DIMCLRE(0);
  static final byLayer = DIMCLRE(256);
}

/// Dimension text color:
/// - 0 = BYBLOCK
/// - 256 = BYLAYER
class DIMCLRT extends Variable {
  DIMCLRT(int value)
      : super(
          'DIMCLRT',
          [GroupCode.integer(70, value)],
        );
  static final byBlock = DIMCLRT(0);
  static final byLayer = DIMCLRT(256);
}

/// Dimension line extension
class DIMDLE extends Variable {
  DIMDLE(double value)
      : super(
          'DIMDLE',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// {@template DIMDLI}
/// Dimension line increment
/// 
/// [DIMDLI (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-D2D1AF3D-004B-4C47-BABE-22B7327EE128)
/// 
/// Controls the spacing of the dimension lines in baseline dimensions.
/// - Type:	Real
/// - Saved in:	Drawing
/// - Initial value:	0.3800 (imperial) or 3.7500 (metric)
/// 
/// Each dimension line is offset from the previous one by this amount, if 
/// necessary, to avoid drawing over it. Changes made with DIMDLI are not 
/// applied to existing dimensions.
/// {@endtemplate}
class DIMDLI extends Variable {
  DIMDLI(double value)
      : super(
          'DIMDLI',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Extension line extension
class DIMEXE extends Variable {
  DIMEXE(double value)
      : super(
          'DIMEXE',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// {@template DIMEXO}
/// Extension line offset
/// 
/// [DIMEXO (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-5CF50ABD-1F77-4609-BEB5-A129BF7DD746)
/// 
/// Specifies how far extension lines are offset from origin points.
/// - Type:	Real
/// - Saved in:	Drawing
/// - Initial value:	0.0625 (imperial) or 0.6250 (metric)
/// 
/// With fixed-length extension lines, this value determines the minimum offset.
/// {@endtemplate}
class DIMEXO extends Variable {
  DIMEXO(double value)
      : super(
          'DIMEXO',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Dimension line gap
class DIMGAP extends Variable {
  DIMGAP(double value)
      : super(
          'DIMGAP',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Linear measurements scale factor
class DIMLFAC extends Variable {
  DIMLFAC(double value)
      : super(
          'DIMLFAC',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Dimension limits generated if nonzero
class DIMLIM extends Variable {
  DIMLIM(int value)
      : super(
          'DIMLIM',
          [GroupCode.integer(70, value)],
        );
}

/// {@template DIMPOST}
/// General dimensioning suffix
///
/// [DIMPOST (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-79CCF9B1-BE33-4158-891C-50E4BF795D8E)
///
/// Specifies a text prefix or suffix (or both) to the dimension measurement.
/// - Type:	String 1
/// - Saved in:	Drawing
/// - Initial value:	None
/// - For example, to establish a suffix for millimeters, set DIMPOST to mm;
/// a distance of 19.2 units would be displayed as 19.2 mm.
/// - If tolerances are turned on, the suffix is applied to the tolerances as
/// well as to the main dimension.
/// - Use <> to indicate placement of the text in relation to the dimension
/// value. For example, enter <>mm to display a 5.0 millimeter radial dimension
/// as "5.0mm". If you entered mm <>, the dimension would be displayed as
/// "mm 5.0". Use the <> mechanism for angular dimensions.
/// {@endtemplate}
class DIMPOST extends Variable {
  DIMPOST(String value)
      : super(
          'DIMPOST',
          [GroupCode.primaryText(value)],
        );
  static final defaultValue = DIMPOST('');
}

/// Rounding value for dimension distances
class DIMRND extends Variable {
  DIMRND(double value)
      : super(
          'DIMRND',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Use separate arrow blocks if nonzero
class DIMSAH extends Variable {
  DIMSAH(int value)
      : super(
          'DIMSAH',
          [GroupCode.integer(70, value)],
        );
}

/// {@template DIMSCALE}
/// Overall dimensioning scale factor
///
/// [DIMSCALE (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-AEA309F0-B831-4432-8085-FB6CD49CDC78)
///
/// Sets the overall scale factor applied to dimensioning variables that specify sizes, distances, or offsets.
/// - Type:	Real
/// - Saved in:	Drawing
/// - Initial value:	1.0
/// 
/// Also affects the leader objects with the LEADER command.
/// - Use MLEADERSCALE to scale multileader objects created with the MLEADER command.
/// - 0.0 = A reasonable default value is computed based on the scaling between the current model space viewport and paper space. If you are in paper space or model space and not using the paper space feature, the scale factor is 1.0.
/// - `>0 = A scale factor is computed that leads text sizes, arrowhead sizes, and other scaled distances to plot at their face values.
/// - DIMSCALE does not affect measured lengths, coordinates, or angles.
/// - Use DIMSCALE to control the overall scale of dimensions. However, if the current dimension style is annotative, DIMSCALE is automatically set to zero and the dimension scale is controlled by the CANNOSCALE system variable. DIMSCALE cannot be set to a non-zero value when using annotative dimensions.
/// {@endtemplate}
class DIMSCALE extends Variable {
  DIMSCALE(double value)
      : super(
          'DIMSCALE',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// First extension line suppressed if nonzero
class DIMSE1 extends Variable {
  DIMSE1(int value)
      : super(
          'DIMSE1',
          [GroupCode.integer(70, value)],
        );
}

/// Second extension line suppressed if nonzero
class DIMSE2 extends Variable {
  DIMSE2(int value)
      : super(
          'DIMSE2',
          [GroupCode.integer(70, value)],
        );
}

/// - 1 = Recompute dimensions while dragging
/// - 0 = Drag original image
class DIMSHO extends Variable {
  DIMSHO._(int value)
      : super(
          'DIMSHO',
          [GroupCode.integer(70, value)],
        );
  static final recomputeDimensionsWhileDragging = DIMSHO._(1);
  static final dragOriginalImage = DIMSHO._(0);
}

/// Suppress outside-extensions dimension lines if nonzero
class DIMSOXD extends Variable {
  DIMSOXD(int value)
      : super(
          'DIMSOXD',
          [GroupCode.integer(70, value)],
        );
}

/// Dimension style name
class DIMSTYLE extends Variable {
  DIMSTYLE(String value)
      : super(
          'DIMSTYLE',
          [GroupCode.name(value)],
        );
}

/// Text above dimension line if nonzero
class DIMTAD extends Variable {
  DIMTAD(int value)
      : super(
          'DIMTAD',
          [GroupCode.integer(70, value)],
        );
}

/// Dimension tolerance display scale factor
class DIMTFAC extends Variable {
  DIMTFAC(double value)
      : super(
          'DIMTFAC',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Text inside horizontal if nonzero
class DIMTIH extends Variable {
  DIMTIH(int value)
      : super(
          'DIMTIH',
          [GroupCode.integer(70, value)],
        );
}

/// Force text inside extensions if nonzero
class DIMTIX extends Variable {
  DIMTIX(int value)
      : super(
          'DIMTIX',
          [GroupCode.integer(70, value)],
        );
}

/// Minus tolerance
class DIMTM extends Variable {
  DIMTM(double value)
      : super(
          'DIMTM',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// If text is outside the extension lines, dimension lines are forced between
///  the extension lines if nonzero
class DIMTOFL extends Variable {
  DIMTOFL(int value)
      : super(
          'DIMTOFL',
          [GroupCode.integer(70, value)],
        );
}

/// Text outside horizontal if nonzero
class DIMTOH extends Variable {
  DIMTOH(int value)
      : super(
          'DIMTOH',
          [GroupCode.integer(70, value)],
        );
}

/// Dimension tolerances generated if nonzero
class DIMTOL extends Variable {
  DIMTOL(int value)
      : super(
          'DIMTOL',
          [GroupCode.integer(70, value)],
        );
}

/// Plus tolerance
class DIMTP extends Variable {
  DIMTP(double value)
      : super(
          'DIMTP',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Dimensioning tick size:
/// - 0 = Draws arrowheads
/// - `> 0 = Draws oblique strokes instead of arrowheads
class DIMTSZ extends Variable {
  DIMTSZ(double value)
      : assert(value >= 0),
        super(
          'DIMTSZ',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Text vertical position
class DIMTVP extends Variable {
  DIMTVP(double value)
      : super(
          'DIMTVP',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Dimensioning text height
class DIMTXT extends Variable {
  DIMTXT(double value)
      : super(
          'DIMTXT',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Controls suppression of zeros for primary unit values
/// - 0 = Suppresses zero feet and precisely zero inches
/// - 1 = Includes zero feet and precisely zero inches
/// - 2 = Includes zero feet and suppresses zero inches
/// - 3 = Includes zero inches and suppresses zero feet
/// - 4 = Suppresses leading zeros in decimal dimensions
/// - 8 = Suppresses trailing zeros in decimal dimensions
/// - 12 = Suppresses both leading and trailing zeros
class DIMZIN extends Variable {
  DIMZIN._(int value)
      : super(
          'DIMZIN',
          [GroupCode.integer(70, value)],
        );
  static final suppress0Ftand0In = DIMZIN._(0);
  static final include0Ftand0In = DIMZIN._(1);
  static final include0FtandSupress0In = DIMZIN._(2);
  static final supress0FtandInclude0In = DIMZIN._(3);
  static final supressLeading0sDec = DIMZIN._(4);
  static final supressTrailing0sDec = DIMZIN._(8);
  static final supressLeadingandTrailing0s = DIMZIN._(12);
}

/// [DRAGMODE (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-0690A755-3B81-44E7-9AB2-5DFED263642F)
///
/// Controls the way dragged objects are displayed.
/// - Type:	Integer
/// - Saved in:	Registry
/// - Initial value:	2
/// - This system variable has the same name as a command. Use the SETVAR command to access this system variable.
/// - When it is on, the image of an object is displayed as you drag it to another location. With some computer configurations, dragging can be time-consuming. Use DRAGMODE to suppress dragging.
/// - 0: Does not display an outline of the object as you drag it
/// - 1: Displays the outline of the object as you drag it only if you enter drag at the Command prompt after selecting the object to drag
/// - 2: Auto; always displays an outline of the object as you drag it
class DRAGMODE extends Variable {
  DRAGMODE._(int value)
      : assert(value >= 0 && value <= 2),
        super(
          'DRAGMODE',
          [GroupCode.integer(70, value)],
        );
  static final doesNotDisplayOutline = DRAGMODE._(0);
  static final displayOutlineIfCommand = DRAGMODE._(1);
  static final alwaysDisplayOutline = DRAGMODE._(2);
}

/// Current elevation set by ELEV command
class ELEVATION extends Variable {
  ELEVATION(double value)
      : super(
          'ELEVATION',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// X, Y, and Z drawing extents upper-right corner (in WCS)
class EXTMAX extends Variable {
  EXTMAX(double x, double y, double z)
      : super(
          'EXTMAX',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// X, Y, and Z drawing extents lower-left corner (in WCS)
class EXTMIN extends Variable {
  EXTMIN(double x, double y, double z)
      : super(
          'EXTMIN',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Fillet radius
class FILLETRAD extends Variable {
  FILLETRAD(double value)
      : super(
          'FILLETRAD',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Fill mode on if nonzero
class FILLMODE extends Variable {
  FILLMODE(int value)
      : super(
          'FILLMODE',
          [GroupCode.integer(70, value)],
        );
}

/// [Handles](https://ezdxf.readthedocs.io/en/stable/dxfinternals/handles.html)
///
/// For DXF R10 until R12 the usage of handles was optional. The header variable $HANDLING set to 1 indicate the usage of handles, else $HANDLING is 0 or missing.
/// For DXF R13 and later the usage of handles is mandatory and the header variable $HANDLING was removed.
class HANDLING extends Variable {
  HANDLING(int value)
      : super(
          'HANDLING',
          [GroupCode.integer(70, value)],
        );
}

/// Next available handle
class HANDSEED extends Variable {
  HANDSEED(String value)
      : super(
          'HANDSEED',
          [GroupCode.handle(value)],
        );
}

/// [INSBASE (System Variable)](https://help.autodesk.com/view/ACD/2023/ENU/?guid=GUID-B0A82E39-CB83-484E-95CB-B35D8114B947)
///
/// Stores the insertion base point set by BASE, which gets expressed as a UCS coordinate for the current space.
///- Type:	3D-point
///- Saved in:	Drawing
///- Initial value:	0.0000,0.0000,0.0000
class INSBASE extends Variable {
  INSBASE(double x, double y, double z)
      : super(
          'INSBASE',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Default drawing units for AutoCAD DesignCenter blocks
/// - 0 = Unitless
/// - 1 = Inches
/// - 2 = Feet
/// - 3 = Miles
/// - 4 = Millimeters
/// - 5 = Centimeters
/// - 6 = Meters
/// - 7 = Kilometers
/// - 8 = Microinches
/// - 9 = Mils
/// - 10 = Yards
/// - 11 = Angstroms
/// - 12 = Nanometers
/// - 13 = Microns
/// - 14 = Decimeters
/// - 15 = Decameters
/// - 16 = Hectometers
/// - 17 = Gigameters
/// - 18 = Astronomical units
/// - 19 = Light years
/// - 20 = Parsecs
/// - 21 = US Survey Feet
/// - 22 = US Survey Inch
/// - 23 = US Survey Yard
/// - 24 = US Survey Mile
class INSUNITS extends Variable {
  INSUNITS._(int value)
      : super(
          'INSUNITS',
          [GroupCode.integer(70, value)],
        );

  static final unspecified = INSUNITS._(0);
  static final inches = INSUNITS._(1);
  static final feet = INSUNITS._(2);
  static final miles = INSUNITS._(3);
  static final millimeters = INSUNITS._(4);
  static final centimeters = INSUNITS._(5);
  static final meters = INSUNITS._(6);
  static final kilometers = INSUNITS._(7);
  static final microinches = INSUNITS._(8);
  static final mils = INSUNITS._(9);
  static final yards = INSUNITS._(10);
  static final angstroms = INSUNITS._(11);
  static final nanometers = INSUNITS._(12);
  static final microns = INSUNITS._(13);
  static final decimeters = INSUNITS._(14);
  static final dekameters = INSUNITS._(15);
  static final hectometers = INSUNITS._(16);
  static final gigameters = INSUNITS._(17);
  static final astronomical = INSUNITS._(18);
  static final lightYears = INSUNITS._(19);
  static final parsecs = INSUNITS._(20);
  static final usSurveyFeet = INSUNITS._(21);
}

/// Nonzero if limits checking is on
class LIMCHECK extends Variable {
  LIMCHECK(int value)
      : super(
          'LIMCHECK',
          [GroupCode.integer(70, value)],
        );
}

/// XY drawing limits upper-right corner (in WCS)
class LIMMAX extends Variable {
  LIMMAX(double x, double y)
      : super(
          'LIMMAX',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
          ],
        );
}

/// XY drawing limits lower-left corner (in WCS)
class LIMMIN extends Variable {
  LIMMIN(double x, double y)
      : super(
          'LIMMIN',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
          ],
        );
}

/// Global linetype scale
class LTSCALE extends Variable {
  LTSCALE(double value)
      : super(
          'LTSCALE',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Units format for coordinates and distances
///
/// [LUNITS (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-D7C80D1F-B1C0-44A9-898E-B3100FF391CB)
///
/// Sets the linear units format for creating objects.
///	- Type:	Integer
///	- Saved in:	Drawing
///	- Initial value:	2
///	- 1: Scientific
///	- 2: Decimal
///	- 3: Engineering
///	- 4: Architectural
///	- 5: Fractional
///
/// LUNITS does not affect the units format of dimension text, which is
/// controlled by the DIMLUNIT system variable and is usually saved with
/// a dimension style.
class LUNITS extends Variable {
  LUNITS._(int value)
      : super(
          'LUNITS',
          [GroupCode.integer(70, value)],
        );

  static final scientific = LUNITS._(1);
  static final decimal = LUNITS._(2);
  static final engineering = LUNITS._(3);
  static final architectural = LUNITS._(4);
  static final fractional = LUNITS._(5);
}

/// Units precision for coordinates and distances
class LUPREC extends Variable {
  LUPREC(int value)
      : super(
          'LUPREC',
          [GroupCode.integer(70, value)],
        );
}

/// Sets maximum number of viewports to be regenerated
class MAXACTVP extends Variable {
  MAXACTVP(int value)
      : super(
          'MAXACTVP',
          [GroupCode.integer(70, value)],
        );
}

/// Name of menu file
class MENU extends Variable {
  MENU(String value)
      : super(
          'MENU',
          [GroupCode.primaryText(value)],
        );
}

/// Mirror text if nonzero
class MIRRTEXT extends Variable {
  MIRRTEXT(int value)
      : super(
          'MIRRTEXT',
          [GroupCode.integer(70, value)],
        );
}

/// [OSMODE (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-DD9B3216-A533-4D47-95D8-7585F738FD75)
///
/// Sets running object snaps.
/// - Type:	Bitcode
/// - Saved in:	Registry
/// - Initial value:	4133
/// - The setting is stored as a bitcode using the sum of the following values:
/// - 0 	NONe
/// - 1 	ENDpoint
/// - 2 	MIDpoint
/// - 4 	CENter
/// - 8 	NODe
/// - 16 	QUAdrant
/// - 32 	INTersection
/// - 64 	INSertion
/// - 128 	PERpendicular
/// - 256 	TANgent
/// - 512 	NEArest
/// - 1024 	Geometric CEnter
/// - 2048 	APParent Intersection
/// - 4096 	EXTension
/// - 8192 	PARallel
/// - 16384 	Suppresses the current running object snaps
/// - To specify more than one running object snap, enter the sum of their values. For example, entering 3 specifies the Endpoint (bitcode 1) and Midpoint (bitcode 2) object snaps.
/// - Note: Developers creating custom routines can use the 16384 bitcode to temporarily suppress the current running object snap settings without losing the original settings.
class OSMODE extends Variable {
  OSMODE(List<OSMODES> values)
      : super(
          'OSMODE',
          [
            GroupCode.integer(
                70,
                values.fold(OSMODES.none.value,
                    (previous, element) => previous + element.value))
          ],
        );
}

enum OSMODES {
  none(0),
  endpoint(1),
  midpoint(2),
  center(4),
  node(8),
  quadrant(16),
  intersection(32),
  insertion(64),
  perpendicular(128),
  tangent(256),
  nearest(512),
  geometricCenter(1024),
  apparentIntersection(2048),
  entension(4096),
  parallel(8192),
  suppress(16384);

  final int value;
  const OSMODES(this.value);
}

/// Ortho mode on if nonzero
class ORTHOMODE extends Variable {
  ORTHOMODE(int value)
      : super(
          'ORTHOMODE',
          [GroupCode.integer(70, value)],
        );
}

/// Point display mode
class PDMODE extends Variable {
  PDMODE(int value)
      : super(
          'PDMODE',
          [GroupCode.integer(70, value)],
        );
}

/// Point display size
class PDSIZE extends Variable {
  PDSIZE(double value)
      : super(
          'PDSIZE',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Current paper space elevation
class PELEVATION extends Variable {
  PELEVATION(double value)
      : super(
          'PELEVATION',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Maximum X, Y, and Z extents for paper space
class PEXTMAX extends Variable {
  PEXTMAX(double x, double y, double z)
      : super(
          'PEXTMAX',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Minimum X, Y, and Z extents for paper space
class PEXTMIN extends Variable {
  PEXTMIN(double x, double y, double z)
      : super(
          'PEXTMIN',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Limits checking in paper space when nonzero
class PLIMCHECK extends Variable {
  PLIMCHECK(int value)
      : super(
          'PLIMCHECK',
          [GroupCode.integer(70, value)],
        );
}

/// Maximum X and Y limits in paper space
class PLIMMAX extends Variable {
  PLIMMAX(double x, double y)
      : super(
          'PLIMMAX',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
          ],
        );
}

/// Minimum X and Y limits in paper space
class PLIMMIN extends Variable {
  PLIMMIN(double x, double y)
      : super(
          'PLIMMIN',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
          ],
        );
}

/// Governs the generation of linetype patterns around the vertices of a 2D polyline:
/// - 1 = Linetype is generated in a continuous pattern around vertices of the polyline
/// - 0 = Each segment of the polyline starts and ends with a dash
class PLINEGEN extends Variable {
  PLINEGEN._(int value)
      : assert(value == 0 || value == 1),
        super(
          'PLINEGEN',
          [GroupCode.integer(70, value)],
        );
  static final continuousPatternAroundVertices = PLINEGEN._(0);
  static final segmentsStartAndEndWithADash = PLINEGEN._(1);
}

/// Default polyline width
class PLINEWID extends Variable {
  PLINEWID(double value)
      : super(
          'PLINEWID',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Controls paper space linetype scaling:
/// - 0 = No special linetype scaling
/// - 1 = Viewport scaling governs linetype scaling
class PSLTSCALE extends Variable {
  PSLTSCALE._(int value)
      : assert(value == 0 || value == 1),
        super(
          'PSLTSCALE',
          [GroupCode.integer(70, value)],
        );
  static final noSpecialScaling = PSLTSCALE._(0);
  static final viewportBasedScaling = PSLTSCALE._(1);
}

/// Current paper space UCS name
class PUCSNAME extends Variable {
  PUCSNAME(String value)
      : super(
          'PUCSNAME',
          [GroupCode.name(value)],
        );
}

/// Current paper space UCS origin
class PUCSORG extends Variable {
  PUCSORG(double x, double y, double z)
      : super(
          'PUCSORG',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Current paper space UCS X axis
class PUCSXDIR extends Variable {
  PUCSXDIR(double x, double y, double z)
      : super(
          'PUCSXDIR',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Current paper space UCS Y axis
class PUCSYDIR extends Variable {
  PUCSYDIR(double x, double y, double z)
      : super(
          'PUCSYDIR',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Quick Text mode on if nonzero
class QTEXTMODE extends Variable {
  QTEXTMODE(int value)
      : super(
          'QTEXTMODE',
          [GroupCode.integer(70, value)],
        );
}

/// REGENAUTO mode on if nonzero
class REGENMODE extends Variable {
  REGENMODE(int value)
      : super(
          'REGENMODE',
          [GroupCode.integer(70, value)],
        );
}

/// Controls the shading of edges
/// - 0 = Faces shaded, edges not highlighted
/// - 1 = Faces shaded, edges highlighted in black
/// - 2 = Faces not filled, edges in entity color
/// - 3 = Faces in entity color, edges in black
class SHADEDGE extends Variable {
  SHADEDGE._(int value)
      : super(
          'SHADEDGE',
          [GroupCode.integer(70, value)],
        );
  static final facesShadedEdgesNotHighlighted = SHADEDGE._(0);
  static final facesShadedEdgesBlackHighlighted = SHADEDGE._(1);
  static final facesNotFilledEdgesInEntityColor = SHADEDGE._(2);
  static final facesInEntityColorEdgesInBlack = SHADEDGE._(3);
}

/// Percent ambient/diffuse light
/// - Range 1-100
/// - Default 70
class SHADEDIF extends Variable {
  SHADEDIF(int value)
      : assert(value >= 1 && value <= 100),
        super(
          'SHADEDIF',
          [GroupCode.integer(70, value)],
        );
  static final defaultValue = SHADEDIF(70);
}

/// Sketch record increment
class SKETCHINC extends Variable {
  SKETCHINC(double value)
      : super(
          'SKETCHINC',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Determines the object type created by the SKETCH command:
/// - 0 = Generates lines
/// - 1 = Generates polylines
/// - 2 = Generates splines
class SKPOLY extends Variable {
  SKPOLY._(int value)
      : assert(value >= 0 && value <= 2),
        super(
          'SKPOLY',
          [GroupCode.integer(70, value)],
        );
  static final generateLines = SKPOLY._(0);
  static final generatePolylines = SKPOLY._(1);
  static final generateSplines = SKPOLY._(2);
}

/// - [SPLFRAME (System Variable)](https://help.autodesk.com/view/ACD/2024/ENU/?guid=GUID-9F9CC9C6-023C-44BC-A0BF-3C25F36C4259)
///
/// Controls the display of helixes and smoothed mesh objects.
/// - Type:	Integer
/// - Saved in:	Drawing
/// - Initial value:	0
/// - 0:  Disables spline frame display which:
///       Does not display the control polygon for helixes.
///       Displays smoothed mesh objects if they have been smoothed.
///       Does not display the invisible edges of 3D faces or polyface meshes.
/// - 1:  Enables spline frame display which:
///       Displays the control polygon for helixes.
///       Displays unsmoothed mesh objects, even if they have been smoothed.
///       Displays the edges of 3D faces and polyface meshes.
/// - Note: To control the display of control vertices for splines, use the CVSHOW and the CVHIDE commands (not available in AutoCAD LT).
class SPLFRAME extends Variable {
  SPLFRAME._(int value)
      : super(
          'SPLFRAME',
          [GroupCode.integer(70, value)],
        );
  static final disableSplineFrameDisplay = SPLFRAME._(0);
  static final enableSplineFrameDisplay = SPLFRAME._(1);
}

/// Number of line segments per spline patch
class SPLINESEGS extends Variable {
  SPLINESEGS(int value)
      : super(
          'SPLINESEGS',
          [GroupCode.integer(70, value)],
        );
}

/// Spline curve type for PEDIT Spline
class SPLINETYPE extends Variable {
  SPLINETYPE(int value)
      : super(
          'SPLINETYPE',
          [GroupCode.integer(70, value)],
        );
}

/// Number of mesh tabulations in first direction
class SURFTAB1 extends Variable {
  SURFTAB1(int value)
      : super(
          'SURFTAB1',
          [GroupCode.integer(70, value)],
        );
}

/// Number of mesh tabulations in second direction
class SURFTAB2 extends Variable {
  SURFTAB2(int value)
      : super(
          'SURFTAB2',
          [GroupCode.integer(70, value)],
        );
}

/// Surface type for PEDIT Smooth
class SURFTYPE extends Variable {
  SURFTYPE(int value)
      : super(
          'SURFTYPE',
          [GroupCode.integer(70, value)],
        );
}

/// Surface density (for PEDIT Smooth) in M direction
class SURFU extends Variable {
  SURFU(int value)
      : super(
          'SURFU',
          [GroupCode.integer(70, value)],
        );
}

/// Surface density (for PEDIT Smooth) in N direction
class SURFV extends Variable {
  SURFV(int value)
      : super(
          'SURFV',
          [GroupCode.integer(70, value)],
        );
}

/// Local date/time of drawing creation (see Special Handling of Date/Time Variables)
class TDCREATE extends Variable {
  TDCREATE(DateTime value)
      : super(
          'TDCREATE',
          [GroupCode.julianDate(value)],
        );
}

/// Cumulative editing time for this drawing (see Special Handling of Date/Time Variables)
class TDINDWG extends Variable {
  TDINDWG(double value)
      : super(
          'TDINDWG',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Local date/time of last drawing update (see Special Handling of Date/Time Variables)
class TDUPDATE extends Variable {
  TDUPDATE(DateTime value)
      : super(
          'TDUPDATE',
          [GroupCode.julianDate(value)],
        );
}

/// User-elapsed timer
class TDUSRTIMER extends Variable {
  TDUSRTIMER(double value)
      : super(
          'TDUSRTIMER',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Default text height
class TEXTSIZE extends Variable {
  TEXTSIZE(double value)
      : super(
          'TEXTSIZE',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Current text style name
class TEXTSTYLE extends Variable {
  TEXTSTYLE(STYLE value)
      : super(
          'TEXTSTYLE',
          [GroupCode.textStyleName(value)],
        );
}

/// Current thickness set by ELEV command
class THICKNESS extends Variable {
  THICKNESS(double value)
      : super(
          'THICKNESS',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// - 1 for previous release compatibility mode
/// - 0 otherwise
class TILEMODE extends Variable {
  TILEMODE._(int value)
      : super(
          'TILEMODE',
          [GroupCode.integer(70, value)],
        );
  static final notPreviousCompatible = TILEMODE._(0);
  static final previousCompatible = TILEMODE._(1);
}

/// Default trace width
class TRACEWID extends Variable {
  TRACEWID(double value)
      : super(
          'TRACEWID',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Name of current UCS
class UCSNAME extends Variable {
  UCSNAME(String value)
      : super(
          'UCSNAME',
          [GroupCode.name(value)],
        );
}

/// Origin of current UCS (in WCS)
class UCSORG extends Variable {
  UCSORG(double x, double y, double z)
      : super(
          'UCSORG',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Direction of the current UCS X axis (in WCS)
class UCSXDIR extends Variable {
  UCSXDIR(double x, double y, double z)
      : super(
          'UCSXDIR',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Direction of the current UCS Y axis (in WCS)
class UCSYDIR extends Variable {
  UCSYDIR(double x, double y, double z)
      : super(
          'UCSYDIR',
          [
            GroupCode.doublePrecision3DPointValue(10, x),
            GroupCode.doublePrecision3DPointValue(20, y),
            GroupCode.doublePrecision3DPointValue(30, z),
          ],
        );
}

/// Low bit set = Display fractions, feet-and-inches, and surveyor's angles in input format
class UNITMODE extends Variable {
  UNITMODE(int value)
      : super(
          'UNITMODE',
          [GroupCode.integer(70, value)],
        );
}

/// {@template simple_dxf.variables.USERI}
/// Five integer variables intended for use by third-party developers
/// {@endtemplate}
class USERI1 extends Variable {
  USERI1(int value)
      : super(
          'USERI1',
          [GroupCode.integer(70, value)],
        );
}

/// {@macro simple_dxf.variables.USERI}
class USERI2 extends Variable {
  USERI2(int value)
      : super(
          'USERI2',
          [GroupCode.integer(70, value)],
        );
}

/// {@macro simple_dxf.variables.USERI}
class USERI3 extends Variable {
  USERI3(int value)
      : super(
          'USERI3',
          [GroupCode.integer(70, value)],
        );
}

/// {@macro simple_dxf.variables.USERI}
class USERI4 extends Variable {
  USERI4(int value)
      : super(
          'USERI4',
          [GroupCode.integer(70, value)],
        );
}

/// {@macro simple_dxf.variables.USERI}
class USERI5 extends Variable {
  USERI5(int value)
      : super(
          'USERI5',
          [GroupCode.integer(70, value)],
        );
}

/// {@template simple_dxf.variables.USERR}
/// Five real variables intended for use by third-party developers
/// {@endtemplate}
class USERR1 extends Variable {
  USERR1(double value)
      : super(
          'USERR1',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// {@macro simple_dxf.variables.USERR}
class USERR2 extends Variable {
  USERR2(double value)
      : super(
          'USERR2',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// {@macro simple_dxf.variables.USERR}
class USERR3 extends Variable {
  USERR3(double value)
      : super(
          'USERR3',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// {@macro simple_dxf.variables.USERR}
class USERR4 extends Variable {
  USERR4(double value)
      : super(
          'USERR4',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// {@macro simple_dxf.variables.USERR}
class USERR5 extends Variable {
  USERR5(double value)
      : super(
          'USERR5',
          [GroupCode.doublePrecisionFloat(40, value)],
        );
}

/// Controls the user timer for the drawing:
/// - 0 = Timer off
/// - 1 = Timer on
class USRTIMER extends Variable {
  USRTIMER._(int value)
      : super(
          'USRTIMER',
          [GroupCode.integer(70, value)],
        );
  static final timerOff = USRTIMER._(0);
  static final timerOn = USRTIMER._(1);
}

/// Controls the properties of xref-dependent layers:
/// - 0 = Don't retain xref-dependent visibility settings
/// - 1 = Retain xref-dependent visibility settings
class VISRETAIN extends Variable {
  VISRETAIN._(int value)
      : super(
          'VISRETAIN',
          [GroupCode.integer(70, value)],
        );
  static final dontRetainSettings = VISRETAIN._(0);
  static final retainSettings = VISRETAIN._(1);
}

/// Determines whether input for the DVIEW and VPOINT command evaluated as relative to the WCS or current UCS:
/// - 0: UCS remains unchanged
/// - 1: UCS changes to the WCS for the duration of the command; the command input is relative to the current UCS
class WORLDVIEW extends Variable {
  WORLDVIEW._(int value)
      : super(
          'WORLDVIEW',
          [GroupCode.integer(70, value)],
        );
  static final dontChangeUCS = WORLDVIEW._(0);
  static final setUcsToWcs = WORLDVIEW._(1);
}
