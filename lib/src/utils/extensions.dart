extension JoinExt on Iterable {
  /// Convert entries to strings and join the strings with new line
  String nlJoin() => join('\n');
}

extension NullCheck on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}
