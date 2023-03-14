import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeOfDayConverter extends JsonConverter<TimeOfDay?, String?> {
  const TimeOfDayConverter();

  @override
  TimeOfDay? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    try {
      final split = json.split(' ');
      final timeParts = split[0].split(':');
      final dayPart = split[1];
      var hour = int.parse(timeParts[0]);
      if (dayPart == 'AM' && hour == 12) {
        hour -= 12;
      } else if (dayPart == 'PM' && hour < 12) {
        hour += 12;
      }
      return TimeOfDay(hour: hour, minute: int.parse(timeParts[1]));
    } on Object catch (_) {
      return null;
    }
  }

  @override
  String? toJson(TimeOfDay? object) {
    if (object == null) {
      return null;
    }
    if (object.hour == 0) {
      return '${object.hour + 12}:${object.minute} AM';
    }
    if (object.hour >= 1 && object.hour <= 12) {
      return '${object.hour}:${object.minute} AM';
    }
    return '${object.hour - 12}:${object.minute} PM';
  }
}