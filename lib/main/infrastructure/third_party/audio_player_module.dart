import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

@module
abstract class AudioPlayerModule {
  @singleton
  AudioPlayer get player => AudioPlayer();
}
