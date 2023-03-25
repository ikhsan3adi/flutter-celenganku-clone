extension CustomDateTimeFormat on DateTime {
  /// [useShortMonthName] 28 Feb 2023
  ///
  /// 31 December 2022
  String toFormattedDateString({bool useShortMonthName = false}) {
    if (useShortMonthName) {
      return "$day ${shortMonthName[month - 1]} $year";
    } else {
      return "$day ${monthName[month - 1]} $year";
    }
  }

  /// Time without seconds, e.g '13:28'
  String toFormattedTimeString() {
    return "$hour:$minute";
  }

  /// 20220314_093058
  String toUrl() {
    return "$year$month${day}_$hour$minute$second";
  }

  static List<String> monthName = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static List<String> shortMonthName = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
}
