import 'package:test/test.dart';
import 'package:typecast/src/bool_typecast.dart';

/// Test for [package:test/src/bool_typecast.dart].
void main() {
  test('num', () {
    expect(0.toBool(), false);
    expect(1.toBool(), true);
    expect((-1).toBool(), true);
    expect(double.nan.toBool(), false);
  });

  test('String', () {
    expect(''.toBool(), false);
    expect('str'.toBool(), true);
  });

  test('Iterable', () {
    expect([].toBool(), true);
    expect([1].toBool(), true);
  });

  test('Map', () {
    expect({}.toBool(), true);
    expect({1: 1}.toBool(), true);
  });

  test('Null', () {
    expect(null.toBool(), false);
  });

  test('bool', () {
    expect(true.toBool(), true);
    expect(false.toBool(), false);
  });

  test('lookup', () {
    final dynamic value = null;
    expect(BoolTypecast.lookup(value), false);

    final dynamic value2 = 1;
    expect(BoolTypecast.lookup(value2), true);

    final Object? value3 = null;
    expect(BoolTypecast.lookup(value3), false);
  });
}
