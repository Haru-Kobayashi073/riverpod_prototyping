import 'package:test/test.dart';
import 'package:riverpod_countup/logic.dart';

void main() {
  Logic target = Logic();
  setUp(
    () async {
      target = Logic();
    },
  );

  test('init', () async {
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 0);
  });
  test('increase', () async {});
  test('decrease', () async {});
  test('reset', () async {});
}
