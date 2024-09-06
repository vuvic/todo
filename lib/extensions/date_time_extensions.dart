extension DateTimeExtensions on DateTime {
  DateTime getEndOfDay() {
    return DateTime(
      year,
      month,
      day,
      23,
      59,
      59,
      999,
    );
  }
}
