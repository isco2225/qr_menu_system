extension DateTimeExtension on DateTime {
  String toReadableRelativeTimeString({
    required String nowString,
    required String Function(int seconds) secondsAgoString,
    required String Function(int minutes) minutesAgoString,
    required String Function(int hours) hoursAgoString,
    required String yesterdayString,
    required String Function(int days) daysAgoString,
    required String Function(int months) monthsAgoString,
 } ) {
    final now = DateTime.now();
    final diff = now.millisecondsSinceEpoch - millisecondsSinceEpoch;
    if (diff < 1000) {
      return nowString;
    }
    if (diff < 60 * 1000) return secondsAgoString((diff / 1000).toInt());

    if (diff < 60 * 60 * 1000) {
      return minutesAgoString((diff / 60 / 1000).toInt());
    }

    if (diff < 24 * 60 * 60 * 1000) {
      return hoursAgoString((diff / 60 / 60 / 1000).toInt());
    }

    if (diff < 2 * 24 * 60 * 60 * 1000) return yesterdayString;

    if (diff < 30 * 24 * 60 * 60 * 1000) {
      return daysAgoString((diff / 24 / 60 / 60 / 1000).toInt());
    }

    if (diff < 365 * 24 * 60 * 60 * 1000) {
      return monthsAgoString((diff / 30 / 24 / 60 / 60 / 1000).toInt());
    }

    return "";
  }
}
