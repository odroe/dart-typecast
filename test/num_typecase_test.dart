import 'package:test/test.dart';
import 'package:typecast/src/num_typecast.dart';

/// Test for [package:test/src/num_typecast.dart].
void main() {
  test('num', () {
    expect(0.toNum(), 0);
    expect(1.toNum(), 1);
    expect((-1).toNum(), -1);
    expect(double.nan.toNum().isNaN, true);
  });

  test('String', () {
    expect(''.toNum(), 0);
    expect('str'.toNum().isNaN, true);
  });

  test('Iterable', () {
    expect([].toNum(), 0);
    expect([1].toNum(), 1);
    expect([1, 2].toNum().isNaN, true);
  });

  test('Map', () {
    expect({}.toNum().isNaN, true);
    expect({1: 1}.toNum().isNaN, true);
  });

  test('Null', () {
    expect(null.toNum(), 0);
  });

  test('bool', () {
    expect(true.toNum(), 1);
    expect(false.toNum(), 0);
  });

  test('lookup', () {
    final dynamic value = null;
    expect(NumTypecast.lookup(value), 0);

    final dynamic value2 = 1;
    expect(NumTypecast.lookup(value2), 1);

    final Object? value3 = null;
    expect(NumTypecast.lookup(value3), 0);
  });
}
