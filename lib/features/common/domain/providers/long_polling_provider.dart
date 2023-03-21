abstract class LongPollingProvider<R> {
  void start();

  void stop();

  Stream<R> get stream;
}
