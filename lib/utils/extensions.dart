import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get whiteOutlined => copyWith(
        shadows: [
          const Offset(-2.5, -2.5),
          const Offset(2.5, -2.5),
          const Offset(-2.5, 2.5),
          const Offset(2.5, 2.5),
        ]
            .map(
              (offset) => Shadow(
                blurRadius: 4,
                offset: offset,
                color: Colors.white,
              ),
            )
            .toList(),
      );

  TextStyle get comfortaa => copyWith(
        fontFamily: 'comfortaa',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaBold => copyWith(
        fontFamily: 'comfortaa_bold',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaLight => copyWith(
        fontFamily: 'comfortaa_light',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaMedium => copyWith(
        fontFamily: 'comfortaa_medium',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaRegular => copyWith(
        fontFamily: 'comfortaa_regular',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get comfortaaSemiBold => copyWith(
        fontFamily: 'comfortaa_semibold',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get delaGothicOne => copyWith(
        fontFamily: 'dela_gothic_one',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );

  TextStyle get jetbrainsMono => copyWith(
        fontFamily: 'jetbrains_mono',
        fontVariations: [
          FontVariation('wght', (fontWeight?.index ?? 3) * 100 + 100),
        ],
      );
}

extension ColorFilterExtension on Color {
  ColorFilter get filter => ColorFilter.mode(this, BlendMode.srcIn);
}

extension FutureListExtension on List {
  Future<Iterable<T>> transform<T>(Future<T> Function(T e) method) async {
    List<T> result = <T>[];
    for (T value in this) {
      result.add(await method(value));
    }
    return result;
  }
}

enum JustDateType {
  onlyTime,
  onlyDate,
  onlyDateNamed,
  dateTime,
  timeDate,
  dateTimeNamed,
  timeDateNamed,
  timeOrDate,
  timeOrDateNamed,
  relative
}

enum IgnoreTimeType { second, minute, hour }

extension DescribeDurationExtension on Duration {
  String? describe(int precision) {
    if (inSeconds < 0) return null;
    int years = inDays < 365 ? 0 : (inDays / 365).round();
    int days = inDays - years * 365;
    int hours = inHours - inDays * Duration.hoursPerDay;
    int minutes = inMinutes - inHours * Duration.minutesPerHour;
    int seconds = inSeconds - inMinutes * Duration.secondsPerMinute;
    // print("years = $years, days = $days, hours = $hours, minutes = $minutes, seconds = $seconds");
    // print("years = $years, days = $inDays, hours = $inHours, minutes = $inMinutes, seconds = $inSeconds");

    var yearsStr = years > 0 ? "$years лет" : null;
    var daysStr = days > 0 ? "$days дней" : null;
    var hoursStr = hours > 0 ? "$hours часов" : null;
    var minutesStr = minutes > 0 ? "$minutes минут" : null;
    var secondsStr = seconds > 0 ? "$seconds секунд" : null;

    List<String> results = [
      if (yearsStr != null) yearsStr,
      if (daysStr != null) daysStr,
      if (hoursStr != null) hoursStr,
      if (minutesStr != null) minutesStr,
      if (secondsStr != null) secondsStr,
    ];
    if (results.isEmpty) return "Только что";

    String description = "";
    for (var element in results) {
      if (precision > 0) {
        description =
            description.isNotEmpty ? "$description, $element" : element;
        precision--;
      }
    }

    return description;
  }
}
extension DescribeDateTimeExtension on DateTime {
  static List<String> monthes = [
    "январь",
    "февраль",
    "март",
    "апрель",
    "май",
    "июнь",
    "июль",
    "август",
    "сентябрь",
    "октябрь",
    "ноябрь",
    "декабрь",
  ];

  String get monthDescribe => monthes[month];

  String get paddedHour => hour.toString().padLeft(2, '0');

  String get paddedMinute => minute.toString().padLeft(2, '0');

  String get paddedDay => day.toString().padLeft(2, '0');

  String get paddedMonth => month.toString().padLeft(2, '0');

  String describe(
      [JustDateType type = JustDateType.relative,
        IgnoreTimeType? ignore]) =>
      toLocal().describeTime(type, ignore);

  String describeTime(
      [JustDateType type = JustDateType.relative, IgnoreTimeType? ignore]) {
    switch (type) {
      case JustDateType.onlyTime:
        return "$paddedHour:$paddedMinute";
      case JustDateType.onlyDate:
        return "$paddedDay.$paddedMonth.${year % 100}";
      case JustDateType.onlyDateNamed:
        return "$day $monthDescribe $year";
      case JustDateType.dateTime:
        return "$paddedDay.$paddedMonth.${year % 100} $paddedHour:$paddedMinute";
      case JustDateType.timeDate:
        return "$paddedHour:$paddedMinute $paddedDay.$paddedMonth.${year % 100}";
      case JustDateType.dateTimeNamed:
        return "$day $monthDescribe $year - $paddedHour:$paddedMinute";
      case JustDateType.timeDateNamed:
        return "$paddedHour:$paddedMinute - $day $monthDescribe $year";
      case JustDateType.timeOrDate:
        return _timeOrDate(false);
      case JustDateType.timeOrDateNamed:
        return _timeOrDate(true);
      case JustDateType.relative:
        return _describe(ignore);
    }
  }

  String _timeOrDate(bool named) {
    var timeDifference = difference(DateTime.now());

    //Меньше суток
    if (timeDifference.inDays > -1) return "$paddedHour:$paddedMinute";
    if (named) return "$day $monthDescribe $year";
    return "$paddedDay.$paddedMonth.${year % 100}";
  }

  String _describe(IgnoreTimeType? ignore) {
    var timeDifference = difference(DateTime.now());

    String long = "${timeDifference.inDays.abs()} дней назад";
    if (timeDifference.inDays <= -365) {
      long = "${(timeDifference.inDays.abs() / 365).round()} лет назад";
    }

    if (timeDifference.inDays == -1) return "вчера";
    if (timeDifference.inDays < -1) return long;

    if (ignore == IgnoreTimeType.hour) return "Только что";
    if (timeDifference.inHours == -1 || timeDifference.inHours == -21) {
      return timeDifference.inHours == -1 ? "час назад" : "21 час назад";
    }
    if (timeDifference.inHours < -20) {
      return "${timeDifference.inHours.abs()} часа назад";
    }
    if (timeDifference.inHours < -4) {
      return "${timeDifference.inHours.abs()} часов назад";
    }
    if (timeDifference.inHours < -1) {
      return "${timeDifference.inHours.abs()} часа назад";
    }

    if (ignore == IgnoreTimeType.minute) return "Только что";
    var result = _chooseVariant(timeDifference.inMinutes,
        firstVariant: "минуту назад",
        secondVariant: "минут назад",
        thirdVariant: "минуты назад");
    if (ignore == IgnoreTimeType.second) return result ?? "Только что";
    result ??= _chooseVariant(timeDifference.inSeconds,
        firstVariant: "секунду назад",
        secondVariant: "секунд назад",
        thirdVariant: "секунды назад");
    return result ?? "Только что";
  }

  String? _chooseVariant(int negativeVal,
      {String firstVariant = "минуту назад",
        String secondVariant = "минут назад",
        String thirdVariant = "минуты назад"}) {
    ///[10,20,30,40,50] минут назад"
    if (negativeVal % 10 == 0 && negativeVal != 0) {
      return "${negativeVal.abs()} $secondVariant";
    }

    ///[1] минуту назад [21,31,41,51] минуту назад
    if (negativeVal % 10 == -1) {
      return negativeVal == -1
          ? firstVariant
          : "${negativeVal.abs()} $firstVariant";
    }

    ///[5,6,7,8,9,11,12,13,14,15,16,17,18,19] минут назад
    if (negativeVal < -4 && negativeVal > -20) {
      return "${negativeVal.abs()} $secondVariant";
    }

    ///[25,26,27,28,29] минут [35,36,37,38,39] минут [45,46,47,48,49] минут [55,56,57,58,59] минут
    if (negativeVal % 10 < -4) {
      return "${negativeVal.abs()} $secondVariant";
    }

    ///[2,3,4] минуты [22,23,24] минуты [32,33,34] минуты [42,43,44] минуты [52,53,54] минуты
    if (negativeVal <= -1) {
      return "${negativeVal.abs()} $thirdVariant";
    }
    return null;
  }
}
extension DescribeAgeExtension on int {
  String get ageDescribe {
    final remainder = this % 10;
    if (remainder > 0 && remainder < 5) return "$this года";
    return "$this лет";
  }
}

extension StringExtension on String {
  //Was 1023 before adding \n in printing
  void printFull({String debugTag = "DEBUG_TAG", int maxSymbols = 1020}) {
    var str = "######$debugTag######\n$this\n######$debugTag######\n";
    if (kDebugMode) {
      while (str.length > maxSymbols) {
        String segment = str.substring(0, maxSymbols);
        print("\n$segment");
        str = str.substring(maxSymbols);
      }

      if (str.isNotEmpty) {
        print("\n$str");
      }
    }
  }

  Map<String, dynamic> get jsonToMap => jsonDecode(this);
}
extension MapExtension on Map {
  String get mapToJson => jsonEncode(this);
}

extension ColorToStringExtension on Color {
  String get hashString => "0x${value.toRadixString(16).padLeft(8, '0')}";
}
extension StringToColorExtension on String {
  Color get hexToColor => Color(int.parse(this));
}
