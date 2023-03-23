import 'package:injectable/injectable.dart';

import '../../../../utils/server_settings.dart';
import '../../application/providers/song_provider.dart';

@Singleton(as: SongProvider)
class ProdSongProvider implements SongProvider {
  const ProdSongProvider({
    required ServerSettings serverSettings,
  }) : _serverSettings = serverSettings;

  final ServerSettings _serverSettings;

  // @override
  // String get url => '${_serverSettings.baseUri}/lobby/song';

  @override
  String get url =>
      'https://s29myt.storage.yandex.net/get-mp3/f936db0b3b17c2f33999b1b281867059/0005f790570ec3cd/rmusic/U2FsdGVkX1_FdzByeCBnzKz2P90IewGxJeK_0UP8gd4GrG11mYf87BPZqNVGLyxe2Be8Mc0gynuYr3MCIti_AJNyyHLYIZ9luDehHnNnrtk/841597c23f37aafd9c94f375b906b7faa5bc52db718f7f15bab4b7bb7cff18ec/17323?track-id=44129391&play=false';
}
