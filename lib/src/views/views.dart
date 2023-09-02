import '../entities/entity.dart';
import '../utils/extensions.dart';

part 'sheet.dart';

abstract class View {
  double width = 0;
  double height = 0;

  List<Entity> generate(Point origin);
}

class Row extends View {
  Row({required this.views});

  final List<View> views;

  @override
  List<Entity> generate(Point origin) {
    List<Entity> entities = [];

    if (views.isNotEmpty) {
      for (var i = 0; i < views.length; i++) {
        entities.addAll(views[i].generate(origin.translate(width, 0, 0)));
        width += views[i].width;
        height = height > views[i].height ? height : views[i].height;
      }
    }

    return entities;
  }
}

class Column extends View {
  Column({required this.views});

  final List<View> views;

  @override
  List<Entity> generate(Point origin) {
    List<Entity> entities = [];

    if (views.isNotEmpty) {
      for (var i = views.length - 1; i >= 0; i--) {
        entities.addAll(views[i].generate(origin.translate(0, height, 0)));
        width = width > views[i].width ? width : views[i].width;
        height += views[i].height;
      }
    }

    return entities;
  }
}

class Padding extends View {
  Padding(
      {required this.view,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.bottom = 0}) {
    super.width = left + view.width + right;
    super.height = bottom + view.height + top;
  }

  Padding.all(double value, {required View view})
      : this(view: view, left: value, right: value, top: value, bottom: value);

  final double left;
  final double right;
  final double top;
  final double bottom;
  final View view;

  @override
  List<Entity> generate(Point origin) {
    return view.generate(origin.translate(left, bottom, 0));
  }
}

class SizedBox extends View {
  SizedBox({this.view, required double width, required double height}) {
    super.width = view?.width ?? width;
    super.height = view?.height ?? height;
  }

  View? view;

  @override
  List<Entity> generate(Point origin) {
    return view.isNull ? [] : view!.generate(origin);
  }
}

class ViewContainer extends View {
  ViewContainer(
      {required this.generator,
      required double width,
      required double height}) {
    super.width = width;
    super.height = height;
  }

  final ViewGenerator generator;

  @override
  List<Entity> generate(Point origin) {
    return generator.generateView(origin, width, height);
  }
}

abstract class ViewGenerator {
  List<Entity> generateView(Point origin, double width, double height);
}
