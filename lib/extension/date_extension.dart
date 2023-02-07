import 'package:intl/intl.dart';

extension DateX on DateTime {
  String format({required String format}) => DateFormat(format).format(this);
}
