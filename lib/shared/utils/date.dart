extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isWeekDay() {
    return !isSaturday() && !isSunday();
  }

  bool isSaturday() {
    return weekday == DateTime.saturday;
  }

  bool isSunday() {
    return weekday == DateTime.sunday;
  }
}

const START_WORK_DURATION = Duration(hours: 8, minutes: 30);
const END_WORK_DURATION = Duration(hours: 17, minutes: 30);
const BREAK_TO_LUNCH_DURATION = Duration(hours: 12, minutes: 00);
const BACK_FROM_LUNCH_DURATION = Duration(hours: 13, minutes: 00);
const TIME_IN_WORK = 8;
const TIME_IN_WORK_MORNING = 3.5;
const TIME_IN_WORK_AFTERNOON = 4.5;

class DateTimeUtils {
  bool inWork(DateTime time) {
    final duration = Duration(hours: time.hour, minutes: time.minute);
    return time.isWeekDay() &&
        duration > START_WORK_DURATION &&
        duration < END_WORK_DURATION;
  }

  Duration getDifferenceWithoutWeekends({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    int day = 0;
    DateTime currentDate = startDate;
    while (currentDate.isBefore(endDate)) {
      if (currentDate.isWeekDay()) {
        day = day + 1;
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }
    return Duration(days: day);
  }

  Duration timeWorkInDay(DateTime time) {
    final duration =
        Duration(hours: time.hour, minutes: time.minute, seconds: time.second);
    if (duration < START_WORK_DURATION) {
      return const Duration();
    }

    if (duration > END_WORK_DURATION) {
      return const Duration(seconds: TIME_IN_WORK * Duration.secondsPerHour);
    }

    if (duration < BREAK_TO_LUNCH_DURATION) {
      return Duration(
        seconds: duration.inSeconds - START_WORK_DURATION.inSeconds,
      );
    }

    if (duration < BACK_FROM_LUNCH_DURATION) {
      return Duration(
        seconds: (TIME_IN_WORK_MORNING * Duration.secondsPerHour).toInt(),
      );
    }

    return Duration(
      seconds: (TIME_IN_WORK_MORNING * Duration.secondsPerHour +
              duration.inSeconds -
              BACK_FROM_LUNCH_DURATION.inSeconds)
          .toInt(),
    );
  }

  Duration _timeWork(DateTime time) {
    double result = 0;
    if (time.isWeekDay()) {
      result += timeWorkInDay(time).inSeconds -
          TIME_IN_WORK * Duration.secondsPerHour;
    }

    result +=
        getDifferenceWithoutWeekends(startDate: DateTime(2017), endDate: time)
                .inDays *
            TIME_IN_WORK *
            Duration.secondsPerHour;

    return Duration(seconds: result.toInt());
  }

  Duration calculateDurationInWork(DateTime startDate, DateTime endDate) {
    if (startDate.isAfter(endDate)) {
      return const Duration();
    }
    return Duration(
      seconds:
          (_timeWork(endDate).inSeconds - _timeWork(startDate).inSeconds) ~/
              Duration.secondsPerHour,
    );
  }

  DateTime getThisMonday() {
    final now = DateTime.now();
    final daysUntilMonday = DateTime.monday - now.weekday;
    final thisMonday = now.add(Duration(days: daysUntilMonday));
    return thisMonday;
  }
}
