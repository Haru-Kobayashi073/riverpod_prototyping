import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_countup/data/count_data.dart';

class SoundLogic {
  static const soundDataUp = 'sounds/Onoma-Inspiration07-1(High).mp3';
  static const soundDataDown = 'sounds/Onoma-Inspiration11-2(Mid).mp3';
  static const soundDataReset = 'sounds/Onoma-Inspiration08-4(High).mp3';

  final AudioCache _cache = AudioCache();
  final AudioPlayer _audioPlayer = AudioPlayer();

  void load() {
    _cache.loadAll([soundDataUp, soundDataDown, soundDataReset]);
  }

  void valueChanged(CountData oldData, CountData newData) {
    if (newData.countUp == 0 && newData.countDown == 0 && newData.count == 0) {
      playResetSound();
    } else if (oldData.countUp + 1 == newData.countUp) {
      playUpSound();
    } else if (oldData.countDown + 1 == newData.countDown) {
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
