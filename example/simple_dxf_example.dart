import 'dart:convert';
import 'dart:io';

import 'package:simple_dxf/simple_dxf.dart';

// final layer1 = Layer(name: 'Layer 1', color: 30);
// final layer2 = Layer(name: 'Layer 2', color: 252);
// final layer3 = Layer(name: 'Layer 3', color: 143);

void main() {


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
            CustomPlot(
              generator: CustomView1(),
              height: 2000,
              width: 2000,
            ),
            CustomPlot(
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
      CustomPlot(
        generator: CustomGridView(),
        width: 100,
        height: 100,
      ),
    ]),
    Row(views: [
      Margin(
        margin: EdgeOffsets.all(100),
        view: CustomPlot(
          generator: CustomGridView(),
          width: 200,
          height: 200,
        ),
      ),
      CustomPlot(
        generator: CustomGridView(),
        width: 300,
        height: 300,
      ),
    ]),
    Row(views: [
      SizedBox(width: 200, height: 300),
      CustomPlot(
        generator: CustomGridView(),
        width: 400,
        height: 400,
      ),
      CustomPlot(
        generator: CustomGridView(),
        width: 500,
        height: 500,
      ),
      CustomPlot(
        generator: CustomGridView(),
        width: 600,
        height: 600,
      ),
    ]),
  ]));

  final dxf = Dxf(
    // headerSection:  HeaderSection.defaultHeaderR12,
    // classesSection: ClassesSection(),
    // tablesSection: TablesSection(),
    // blocksSection: BlocksSection(),
    entitiesSection: EntitiesSection(entities: [
      ...sheet.getEntities(Point(0, 0, 0)),
      ...sheet2.getEntities(Point(1000, 1000, 0)),
    ]),
    // objectsSection: ObjectsSection(),
  );

  // Write to file
  final file = File('${DateTime.now()} generated.dxf');
  file.writeAsString(dxf.toString(), encoding: ascii);
  print('Saved to ${file.path}');
}

class CustomView1 extends CustomPlotter {
  @override
  List<Entity> plot(Point origin, double width, double height) {
    final line = Line(
      p1: Point(0, 0, 0),
      p2: Point(1000, 1000, 0),
      scale: 1,
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

class CustomView2 extends CustomPlotter {
  @override
  List<Entity> plot(Point origin, double width, double height) {
    final rect = Rectangle.fromLBWH(0, 0, 1000, 1000);

    return [rect];
  }
}

class CustomGridView extends CustomPlotter {
  @override
  List<Entity> plot(Point origin, double width, double height) {
    Rectangle viewOutline =
        Rectangle.fromLBWH(origin.x, origin.y, width, height);

    return [viewOutline];
  }
}
