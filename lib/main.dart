// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/data/count_data.dart';
import 'package:riverpod_countup/provider.dart';
import 'package:riverpod_countup/view_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: MyHomePage(ViewModel()));
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage(
    this.viewModel, {
    super.key,
  });
  final ViewModel viewModel;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>
    with TickerProviderStateMixin {
  late ViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;
    _viewModel.setRef(ref, this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              Text(ref.watch(titleProvider)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ref.watch(messageProvider),
            ),
            Text(
              _viewModel.count,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: _viewModel.onIncrease,
                  child: ScaleTransition(
                      scale: _viewModel.animationPlus,
                      child: RotationTransition(
                        turns: _viewModel.animationPlus,
                        child: const Icon(CupertinoIcons.plus))),
                ),
                FloatingActionButton(
                  onPressed: _viewModel.onDecrease,
                  child: ScaleTransition(
                      scale: _viewModel.animationMinus,
                      child: const Icon(CupertinoIcons.minus)),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  _viewModel.countUp,
                  style: const TextStyle(fontSize: 30),
                ),
                Text(
                  _viewModel.countDown,
                  style: const TextStyle(fontSize: 30),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.onReset,
        child: ScaleTransition(
            scale: _viewModel.animationReset,
            child: const Icon(CupertinoIcons.refresh)),
      ),
    );
  }
}
