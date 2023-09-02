part of 'views.dart';

// TODO Implement sheet properties

/// Class to define sheet layout, sheet size,
/// and other properties
class Sheet extends View {
  Sheet({
    required this.view,
  }) {
    super.width = width;
    super.height = height;
  }

  final View view;

  @override
  List<Entity> generate(Point origin) {
    return view.generate(origin);
  }
}
