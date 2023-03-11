import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>(
  (ref) => 'RiverPod Demo',
);

final messageProvider =
    Provider<String>((ref) => 'You have pushed the button this many times:');
