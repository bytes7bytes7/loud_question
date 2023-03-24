import 'package:just_audio/just_audio.dart';

class BytesAudioSource extends StreamAudioSource {
  BytesAudioSource(this._bytes);

  final List<int> _bytes;

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    return StreamAudioResponse(
      sourceLength: _bytes.length,
      contentLength: (start ?? 0) - (end ?? _bytes.length),
      offset: start ?? 0,
      stream: Stream.fromIterable([_bytes.sublist(start ?? 0, end)]),
      contentType: 'audio/mpeg',
    );
  }
}
