import 'package:intl/intl.dart';

class DateFormatter {
  static formatDate(String? value) {
    if (value != null) {
      DateTime date = DateTime.parse(value).toLocal();
      String result = DateFormat('dd-MM-yyyy').format(date);
      return result;
    }

    return "";
  }

  static formatTime(String? value) {
    if (value != null) {
      DateTime now = DateTime.now().toLocal();
      String tempDate = DateFormat('yyyy-MM-dd').format(now);
      String temp = "$tempDate $value";
      DateTime dateTime = DateTime.parse(temp).toLocal();
      String result = DateFormat('hh:mm a').format(dateTime);
      return result;
    }

    return "";
  }

  static getDateTime({String? date, String? time}) {
    if (date != null && time != null) {
      DateTime tempDate = DateTime.parse(date).toLocal();
      String resultDate = DateFormat('yyyy-MM-dd').format(tempDate);
      String tempDateTime = "$resultDate $time";
      DateTime dateTime = DateTime.parse(tempDateTime).toLocal();
      return dateTime.toString();
    }

    return '';
  }
}
