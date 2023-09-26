import 'dart:convert';
import 'dart:io';

import 'package:simple_dxf/simple_dxf.dart';

final layer1 = LAYEREntry(name: 'Layer 1', color: 30);
final layer2 = LAYEREntry(name: 'Layer 2', color: 252);
final layer3 = LAYEREntry(name: 'Layer 3', color: 143);

Text text = Text(origin: Point(0, 0), textHeight: 20, text: 'Sample dxf text');
Block textBlock = Block(entity: text, flag: 1, basePoint: Point(0, 0));

void main() {
  Sheet sheet = Sheet(
      view: Column(views: [
    Row(views: [
      CustomPlot(
        generator: CustomView(),
        width: 600,
        height: 600,
      ),
    ]),
  ]));

  final dxf = Dxf(
    blocksSection: BlocksSection(blocks: [textBlock]),
    entitiesSection: EntitiesSection(entities: [
      ...sheet.getEntities(Point(1000, 1000, 0)),
    ]),
  );

  // Write to file
  final file = File(
      '${'${DateTime.now()} generated'.replaceAll(':', '').replaceAll('.', '').replaceAll('-', '').split(' ').join('_')}.dxf');
  file.writeAsString(dxf.toString(), encoding: ascii);
  print('Saved to ${file.path}');
}

class CustomView extends CustomPlotter {
  @override
  List<Entity> plot(Point origin, double width, double height) {
    Rectangle plotOutline =
        Rectangle.fromLBWH(origin.x, origin.y, width, height)..layer = layer1;

    Circle circle = Circle.radius(origin: origin, radius: 100)..layer = layer2;

    Insert insertText = Insert(block: textBlock, insertionPoint: Point(10, 20))
      ..layer = layer3;

    return [
      plotOutline,
      circle,
      insertText,
    ];
  }
}
