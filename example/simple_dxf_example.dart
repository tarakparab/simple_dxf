import 'dart:io';

import 'package:simple_dxf/simple_dxf.dart';

// final layer1 = Layer(name: 'Layer 1', color: 30);
// final layer2 = Layer(name: 'Layer 2', color: 252);
// final layer3 = Layer(name: 'Layer 3', color: 143);

void main() {
  // final headerSection = HeaderSection(insUnits: InsUnits.millimeters);

  // final tablesSection = TablesSection(
  //   lineTypeTable: LineTypeTable(tableEntries: [
  //     LineType.continuous,
  //   ]),
  //   layerTable: LayerTable(tableEntries: [
  //     layer1,
  //     layer2,
  //     layer3,
  //   ]),
  // );

  final sheet = Sheet(
    view: Column(
      views: [
        Row(
          views: [
            ViewContainer(
              generator: CustomView1(),
              height: 2000,
              width: 2000,
            ),
            ViewContainer(
              generator: CustomView2(),
              height: 2000,
              width: 2000,
            ),
          ],
        ),
      ],
    ),
  );

  Sheet sheet2 = Sheet(
      view: Column(views: [
    Row(views: [
      ViewContainer(
        generator: CustomGridView(),
        width: 100,
        height: 100,
      ),
    ]),
    Row(views: [
      Padding.all(
        100,
        view: ViewContainer(
          generator: CustomGridView(),
          width: 200,
          height: 200,
        ),
      ),
      ViewContainer(
        generator: CustomGridView(),
        width: 300,
        height: 300,
      ),
    ]),
    Row(views: [
      SizedBox(width: 200, height: 300),
      ViewContainer(
        generator: CustomGridView(),
        width: 400,
        height: 400,
      ),
      ViewContainer(
        generator: CustomGridView(),
        width: 500,
        height: 500,
      ),
      ViewContainer(
        generator: CustomGridView(),
        width: 600,
        height: 600,
      ),
    ]),
  ]));

  final dxf = Dxf(
    // headerSection: headerSection,
    // tablesSection: tablesSection,
    entitiesSection: EntitiesSection(entities: [
      ...sheet.generate(Point(x: 0, y: 0, z: 0)),
      ...sheet2.generate(Point(x: 1000, y: 1000, z: 0))
    ]),
  );

  // Write to file
  final file = File('${DateTime.now()} generated.dxf');
  file.writeAsString(dxf.toString());
  print('Saved to ${file.path}');
}

class CustomView1 extends ViewGenerator {
  @override
  List<Entity> generateView(Point origin, double width, double height) {
    final line = Line(
      p1: Point(x: 0, y: 0, z: 0),
      p2: Point(x: 1000, y: 1000, z: 0),
    );

    final polyline = Polyline(vertices: [
      Vertex(x: 0, y: 0, z: 0),
      Vertex(x: 200, y: 200, z: 0),
      Vertex(x: 300, y: 0, z: 0),
      Vertex(x: 400, y: 200, z: 0),
      Vertex(x: 500, y: 0, z: 0),
    ]);

    return [
      line,
      polyline,
    ];
  }
}

class CustomView2 extends ViewGenerator {
  @override
  List<Entity> generateView(Point origin, double width, double height) {
    final rect = Rectangle.fromLBWH(0, 0, 1000, 1000);

    return [rect];
  }
}

class CustomGridView extends ViewGenerator {
  @override
  List<Entity> generateView(Point origin, double width, double height) {
    Rectangle viewOutline =
        Rectangle.fromLBWH(origin.x, origin.y, width, height);

    return [viewOutline];
  }
}
