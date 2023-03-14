extension DateTimeExtension on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  DateTime get dateHourOnly => DateTime(year, month, day, hour);
}