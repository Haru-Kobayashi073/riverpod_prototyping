import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:riverpod_countup/main.dart';
import 'package:riverpod_countup/view_model.dart';

void main() {
  testGoldens('normal', (tester) async {
    const iPhone55 =
        Device(size: Size(414, 736), name: 'iPhone55', devicePixelRatio: 3.0);
    List<Device> devices = [iPhone55];
    ViewModel viewModel = ViewModel();

    // await tester.pumpWidgetBuilder(const ProviderScope(child: MyHomePage()));
  });
}