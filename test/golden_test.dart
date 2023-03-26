import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_countup/main.dart';
import 'package:riverpod_countup/provider.dart';
import 'package:riverpod_countup/view_model.dart';

class MockViewModel extends Mock implements ViewModel {}

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  const iPhone55 =
      Device(size: Size(414, 736), name: 'iPhone55', devicePixelRatio: 3.0);
  List<Device> devices = [iPhone55];
  testGoldens('normal', (tester) async {
    ViewModel viewModel = ViewModel();

    await tester.pumpWidgetBuilder(ProviderScope(child: MyHomePage(viewModel)));
    await multiScreenGolden(
      tester,
      'MyHomePage_0init',
      devices: devices,
    );

    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    await multiScreenGolden(tester, 'myHomePage_1tapped', devices: devices);
  });

  testGoldens('viewModelTest', (tester) async {
    var mock = MockViewModel();
    when(() => mock.count).thenReturn(1123456789.toString());
    when(() => mock.countUp).thenReturn(2123456789.toString());
    when(() => mock.countDown).thenReturn(3123456789.toString());

    // final mockTitleProvider = Provider<String>((ref) => 'mockTitle');
    // final mockMesssageProvider = Provider<String>((ref) => 'mockMessage');

    await tester.pumpWidgetBuilder(
      ProviderScope(
        overrides: [
          titleProvider.overrideWithValue('mockTitle'),
          messageProvider.overrideWithValue('mockMessage')
        ],
        child: MyHomePage(mock),
      )
    );

    await multiScreenGolden(tester, 'myHomePage_mock', devices: devices);

    verifyNever(() => mock.onIncrease());
    verifyNever(() => mock.onDecrease());
    verifyNever(() => mock.onReset());

    await tester.tap(find.byIcon(CupertinoIcons.plus));

    verify(() => mock.onIncrease()).called(1);
    verifyNever(() => mock.onDecrease());
    verifyNever(() => mock.onReset());

    await tester.tap(find.byIcon(CupertinoIcons.minus));

    verifyNever(() => mock.onIncrease());
    verify(() => mock.onDecrease()).called(1);
    verifyNever(() => mock.onReset());
  });
}
