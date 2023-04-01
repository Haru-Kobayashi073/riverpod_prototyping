import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_countup/data/count_data.dart';
import 'package:riverpod_countup/logic/count_data_changed_notifier.dart';

class SoundLogic with COuntDataChangedNotifier{
  static const soundDataUp = 'sounds/Onoma-Inspiration07-1(High).mp3';
  static const soundDataDown = 'sounds/Onoma-Inspiration11-2(Mid).mp3';
  static const soundDataReset = 'sounds/Onoma-Inspiration08-4(High).mp3';

  final AudioCache _cache = AudioCache();
  final AudioPlayer _audioPlayer = AudioPlayer();

  void load() {
    _cache.loadAll([soundDataUp, soundDataDown, soundDataReset]);
  }

  @override
  void valueChanged(CountData oldValue, CountData newValue) {
    if (newValue.countUp == 0 && newValue.countDown == 0 && newValue.count == 0) {
      playResetSound();
    } else if (oldValue.countUp + 1 == newValue.countUp) {
      playUpSound();
    } else if (oldValue.countDown + 1 == newValue.countDown) {
      playDownSound();
    }
  }

  void playUpSound() {
    _audioPlayer.play(AssetSource(soundDataUp));
  }

  void playDownSound() {
    _audioPlayer.play(AssetSource(soundDataDown));
  }

  void playResetSound() {
    _audioPlayer.play(AssetSource(soundDataReset));
  }
}
