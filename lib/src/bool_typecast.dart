/// [bool] typecast.
///
/// Your class doesn't need to implement [BoolTypecast] in most cases, because it should be a [true] value by itself.
///
/// Although not recommended, we still allow you to change whether your class should be `true` or `false`:
///
/// ```dart
/// class MyClass implements BoolTypecast {
///   dynamic value;
///
///   @override
///   bool toBool() => value != null;
/// }
/// ```
abstract class BoolTypecast {
  const BoolTypecast();

  /// Returns a [bool] type value.
  bool toBool() => true;

  /// Static method to convert [value] to [bool].
  static bool lookup<T>(T value) => value.toBool();
}

/// Extend the [BoolTypecast.toBool] method for [T] type.
extension TypecastBoolExtension<T> on T {
  /// [Object] typecast, [Object] type conversion to [bool].
  ///
  /// @see https://developer.mozilla.org/en-US/docs/Glossary/Truthy
  ///
  /// ```dart
  /// Object().toBool(); // true
  /// 1.toBool(); // true
  /// 'str'.toBool(); // true
  /// [].toBool(); // true
  /// {}.toBool(); // true
  /// null.toBool(); // false
  /// true.toBool(); // true
  /// ```
  bool toBool() {
    // If this is a [BoolTypecast] instance, call the [BoolTypecast.toBool] method.
    if (this is BoolTypecast) {
      return (this as BoolTypecast).toBool();

      // If this is a [num] instance, call the [NumTypecastBoolExtension.toBool] method.
    } else if (this is num) {
      return (this as num) > 0 || (this as num) < 0;

      // If this is a [String] instance, call the [StringTypecastBoolExtension.toBool] method.
    } else if (this is String) {
      return (this as String).isNotEmpty;

      // If this is a [Iterable] instance, call the [IterableTypecastBoolExtension.toBool] method.
    } else if (this is Iterable) {
      return true;

      // If this is a [Map] instance, call the [MapTypecastBoolExtension.toBool] method.
    } else if (this is Map) {
      return true;

      // If this is a [bool] instance, call the [BoolTypecastBoolExtension.toBool] method.
    } else if (this is bool) {
      return (this as bool);

      // If this is [null] instance, call the [NullTypecastBoolExtension.toBool] method.
    } else if (this == null) {
      return false;
    }

    // Always returns [true].
    // @see https://developer.mozilla.org/en-US/docs/Glossary/Truthy
    return true;
  }
}
