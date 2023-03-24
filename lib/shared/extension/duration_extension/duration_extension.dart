extension CustomDuration on Duration {
  int get inWeek {
    return (inDays / 7).round();
  }

  int get inMonth {
    return (inDays / 30).round();
  }
}
