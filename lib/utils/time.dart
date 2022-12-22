import 'package:date_format/date_format.dart';

String getTime(DateTime t) {
  return formatDate(t, [HH, ':', nn]);
}

String getDay(DateTime t) {
  return formatDate(t, [yyyy, '-', mm, "-", dd]);
}
