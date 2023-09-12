import 'dart:math' as math;

import '../group_codes.dart';
import '../tables/table.dart';
import '../utils/extensions.dart';

part 'line.dart';
part 'point.dart';
part 'polyline.dart';
part 'seqend.dart';
part 'vertex.dart';

abstract class Entity {
  Entity({required this.name});

  String name;

  LAYEREntry layer = LAYEREntry.zero;
}
