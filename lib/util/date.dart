import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateUtil {
  DateTime fromString(String date) {
    var inputFormat = DateFormat('MM/dd/yyyy');
    return inputFormat.parse(date);
  }

  String toText(DateTime date) {
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(date);
  }
}
