import 'package:audioplayers/audioplayers.dart';

class SoundLogic {
  static const soundDataUp = 'sounds/Onoma-Inspiration07-1(High).mp3';
  static const soundDataDown = 'sounds/Onoma-Inspiration11-2(Mid).mp3';
  static const soundDataReset = 'sounds/Onoma-Inspiration08-4(High).mp3';

  final AudioCache _cache = AudioCache();
  final AudioPlayer _audioPlayer = AudioPlayer();

  void load() {
    _cache.loadAll([soundDataUp, soundDataDown, soundDataReset]);
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
