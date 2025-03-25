import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum DateTimeType {
  date,
  dateHyphen,
  dateSecondHyphen,
  dateAndTime,
  dateTimeWeekDay,
  monthly,
  dateTimeSecond,
  dateTimeSecondHyphen,
  monthHyphen,
  time,
  monthYear,
}

extension DateTimeTypeExtenstions on DateTimeType {
  String getDateFormat() {
    switch (this) {
      case DateTimeType.date:
        return 'dd/MM/yyyy';
      case DateTimeType.dateAndTime:
        return 'dd/MM/yyyy HH:mm';
      case DateTimeType.dateSecondHyphen:
        return 'MM/dd/yyyy';
      case DateTimeType.dateTimeWeekDay:
        return '${DateFormat.WEEKDAY}, ${DateFormat.MONTH} ${DateFormat.DAY}, ${DateFormat.YEAR}';
      case DateTimeType.monthly:
        return 'MM/yyyy';
      case DateTimeType.dateTimeSecond:
        return 'dd/MM/yyyy HH:mm:ss';
      case DateTimeType.dateHyphen:
        return 'yyyy-MM-dd';
      case DateTimeType.dateTimeSecondHyphen:
        return 'yyyy-MM-dd HH:mm:ss';
      case DateTimeType.monthHyphen:
        return 'yyyy-MM';
      case DateTimeType.time:
        return 'HH:mm';
      case DateTimeType.monthYear:
        return 'MM/yyyy';
    }
  }
}

extension DateTimeExtensions on DateTime {
  String format({DateTimeType type = DateTimeType.date, bool utc = false}) {
    return DateFormat(type.getDateFormat()).format(utc ? toUtc() : this);
  }

  double getDifferenceWithoutWeekends({required DateTime endDate}) {
    double duration = 0.0;
    DateTime currentDate = this;
    while (currentDate.isBefore(endDate)) {
      if (currentDate.isWeekDay()) {
        duration = duration + 1;
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }
    return duration;
  }

  DateTime firstDayInMonth() => DateTime(year, month, 1);

  DateTime lastDayInMonth() =>
      month < 12 ? DateTime(year, month + 1, 0) : DateTime(year + 1, 1, 0);

  DateTime addMonth(int step) => DateTime(
        year,
        month + step,
        day,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );

  DateTime zeroTime() => DateTime(year, month, day);

  DateTime goToMonth(int step) =>
      firstDayInMonth().addMonth(step).firstDayInMonth();

  bool isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
    return isAtSameMomentAs | date.isAfter(dateTime);
  }

  bool isBeforeOrEqualTo(DateTime dateTime) {
    final date = this;
    final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
    return isAtSameMomentAs | date.isBefore(dateTime);
  }

  bool isBetween(
    DateTime fromDateTime,
    DateTime toDateTime,
  ) {
    final date = this;
    final isAfter = date.isAfterOrEqualTo(fromDateTime);
    final isBefore = date.isBeforeOrEqualTo(toDateTime);
    return isAfter && isBefore;
  }

  DateTimeRange getFirstAndLastMomentToday() {
    return getFirstAndLastMoment(1);
  }

  DateTimeRange getFirstAndLastMoment(int range) {
    final startDate = zeroTime();
    final endDate = startDate.add(Duration(days: range, seconds: -1));
    return DateTimeRange(start: startDate, end: endDate);
  }
}

extension DateTimeStringExtensions on String {
  DateTime? toDate({required DateTimeType type, bool utc = false}) {
    try {
      return DateFormat(type.getDateFormat()).parse(this, utc);
    } on FormatException catch (_) {
      return null;
    }
  }
}

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

extension DateTimeRangeExtensions on DateTimeRange {
  int get dayWorkDuration => () {
        int day = 0;
        DateTime currentDate = start;
        while (currentDate.isBeforeOrEqualTo(end)) {
          if (currentDate.isWeekDay()) {
            day = day + 1;
          }
          currentDate = currentDate.add(const Duration(days: 1));
        }
        return day;
      }();
}