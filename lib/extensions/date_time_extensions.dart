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
      999,
    );
  }

  String getDayName() {
    const List<String> dayNames = [
      'Monday', // 1
      'Tuesday', // 2
      'Wednesday', // 3
      'Thursday', // 4
      'Friday', // 5
      'Saturday', // 6
      'Sunday', // 7
    ];
    return dayNames[weekday - 1];
  }
}
