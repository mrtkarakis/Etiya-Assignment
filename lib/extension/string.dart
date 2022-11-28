extension StringExtension on String {
  String get capitalize {
    return length > 2
        ? "${this[0].toUpperCase()}${substring(1)}"
        : toUpperCase();
  }

  String get snakeCaseToString {
    return replaceAll("_", " ").capitalize;
  }
}
