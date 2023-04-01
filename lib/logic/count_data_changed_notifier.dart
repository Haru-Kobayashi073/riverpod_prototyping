import 'package:riverpod_countup/data/count_data.dart';

abstract class COuntDataChangedNotifier {
  void valueChanged(CountData oldValue, CountData newValue);
}
