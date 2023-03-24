abstract class DateTimeProvider {
  Future<void> init();

  void dispose();

  DateTime now();
}
