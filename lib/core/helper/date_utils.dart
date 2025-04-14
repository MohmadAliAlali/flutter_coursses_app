
import 'package:intl/intl.dart';

class DateUtils {
  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }
}