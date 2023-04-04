import 'package:riverpod_countup/data/count_data.dart';

typedef ValueChangedCondition = bool Function(CountData oldValue, CountData newValue);

abstract class COuntDataChangedNotifier {
  void valueChanged(CountData oldValue, CountData newValue);
}
