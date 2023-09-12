import '../entities/entity.dart';
import '../utils/extensions.dart';
import 'dart:math' as math;

part 'sheet.dart';

abstract class View {
  double width = 0;
  double height = 0;

  List<Entity> getEntities(Point origin);
}

class Row extends View {
  Row({required this.views});

  final List<View> views;

  @override
  List<Entity> getEntities(Point origin) {
    List<Entity> entities = [];

    if (views.isNotEmpty) {
      for (var i = 0; i < views.length; i++) {
        entities.addAll(views[i].getEntities(origin.translate(width, 0, 0)));
        width += views[i].width;
        height = math.max(height, views[i].height);
      }
    }

    return entities;
  }
}

class Column extends View {
  Column({required this.views});

  final List<View> views;

  @override
  List<Entity> getEntities(Point origin) {
    List<Entity> entities = [];

    if (views.isNotEmpty) {
      for (var i = views.length - 1; i >= 0; i--) {
        entities.addAll(views[i].getEntities(origin.translate(0, height, 0)));
        height += views[i].height;

        width = math.max(width, views[i].width);
      }
    }

    return entities;
  }
}

class EdgeOffsets {
  EdgeOffsets._(
      {required this.left,
      required this.top,
      required this.right,
      required this.bottom});

  final double left;
  final double top;
  final double right;
  final double bottom;

  EdgeOffsets.all(double all)
      : left = all,
        top = all,
        right = all,
        bottom = all;

  EdgeOffsets.only(
      {this.left = 0, this.top = 0, this.right = 0, this.bottom = 0});

  EdgeOffsets.symmetric({double horizontal = 0, double vertical = 0})
      : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;
}

class Margin extends View {
  Margin({required this.view, required this.margin}) {
    super.width = margin.left + view.width + margin.right;
    super.height = margin.bottom + view.height + margin.top;
  }

  final View view;
  final EdgeOffsets margin;

  @override
  List<Entity> getEntities(Point origin) {
    return view.getEntities(origin.translate(margin.left, margin.bottom));
  }
}

class SizedBox extends View {
  SizedBox({this.view, required double width, required double height}) {
    super.width = view?.width ?? width;
    super.height = view?.height ?? height;
  }

  View? view;

  @override
  List<Entity> getEntities(Point origin) {
    return view.isNull ? [] : view!.getEntities(origin);
  }
}

class CustomPlot extends View {
  CustomPlot(
      {required this.generator,
      required double width,
      required double height}) {
    super.width = width;
    super.height = height;
  }

  final CustomPlotter generator;

  @override
  List<Entity> getEntities(Point origin) =>
      generator.plot(origin, width, height);
}

abstract class CustomPlotter {
  List<Entity> plot(Point origin, double width, double height);
}
