/// [num] Typecast.
abstract class NumTypecast {
  const NumTypecast();

  /// Returns a [num] type value.
  num toNum() => double.nan;

  /// Static method to convert [value] to [num].
  static num lookup<T>(T value) => value.toNum();
}

/// [int] Typecast.
abstract class IntTypecast extends NumTypecast {
  const IntTypecast();

  /// Returns a [int] type value.
  int toInt() => toNum().toInt();

  /// Static method to convert [value] to [int].
  static int lookup<T>(T value) => value.toInt();
}

/// [double] Typecast.
abstract class DoubleTypecast extends NumTypecast {
  const DoubleTypecast();

  /// Returns a [double] type value.
  double toDouble() => toNum().toDouble();

  /// Static method to convert [value] to [double].
  static double lookup<T>(T value) => value.toDouble();
}

/// Extend the [NumTypecast.toNum] method for [T] type.
extension TypecastNumExtension<T> on T {
  /// [T] typecast, [T] type conversion to [num].
  ///
  /// [T] instance always returns [double.nan].
  ///
  /// ```dart
  /// Object().toNum(); // NaN
  /// ```
  num toNum() {
    // If the [T] instance is [num], return it.
    if (this is num) return this as num;

    // If the [T] instance is [bool]
    if (this is bool) return (this as bool) ? 1 : 0;

    // If the [T] instance is [String]
    if (this is String) {
      return num.tryParse((this as String)) ??
          ((this as String).isEmpty ? 0 : double.nan);
    }

    // If the [T] instance is [Iterable], calls [single.toNum].
    if (this is Iterable) {
      final Iterable iterable = this as Iterable;
      if (iterable.isEmpty) return 0;
      if (iterable.length == 1) return NumTypecast.lookup(iterable.single);

      return double.nan;
    }

    // If the [T] implements [NumTypecast], calls [toNum].
    if (this is NumTypecast) return (this as NumTypecast).toNum();

    // If the [T] instance is [null], return [0].
    if (this == null) return 0;

    // Otherwise, return [double.nan].
    return double.nan;
  }

  /// [T] typecast, [T] type conversion to [int].
  ///
  /// [T] instance always returns [double.nan].
  ///
  /// ```dart
  /// Object().toInt(); // [TypeError]
  /// ```
  int toInt() {
    // If the [T] implements [IntTypecast], calls [toInt].
    if (this is IntTypecast) return (this as IntTypecast).toInt();

    // Otherwise, return [num.toInt].
    return toNum().toInt();
  }

  /// [T] typecast, [T] type conversion to [double].
  ///
  /// [T] instance always returns [double.nan].
  ///
  /// ```dart
  /// Object().toDouble(); // NaN
  /// ```
  double toDouble() {
    // If the [T] implements [DoubleTypecast], calls [toDouble].
    if (this is DoubleTypecast) return (this as DoubleTypecast).toDouble();

    // Otherwise, return [num.toDouble].
    return toNum().toDouble();
  }
}
