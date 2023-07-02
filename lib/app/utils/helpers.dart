import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String dateToString({
  required DateTime date,
  String? separator = '',
  bool withYear = true,
  bool usingMonthName = false,
  bool showTime = false,
  bool usingDayName = false,
  bool withSeconds = false,
}) {
  String monthName = (usingMonthName
      ? OrdoMonth.elementAt(date.month - 1)
      : date.month.toString().padLeft(2, "0"));
  String year = (withYear ? date.year.toString().padLeft(4, "0") : "");
  String withTime = (showTime
      ? ' ${date.hour.toString().padLeft(2, "0")}:${date.minute.toString().padLeft(2, "0")}${withSeconds ? ':${date.second.toString().padLeft(2, "0")}' : ''} WIB'
      : '');
  String dayName =
      usingDayName ? '${getDay(DateFormat.E().format(date))}, ' : '';

  return '$dayName${date.day.toString().padLeft(2, "0")}$separator$monthName$separator$year$withTime';
}

const List<String> OrdoMonth = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember'
];

String getDay(String dayInEnglish) {
  switch (dayInEnglish) {
    case 'Mon':
      return 'Senin';
    case 'Tue':
      return 'Selasa';
    case 'Wed':
      return 'Rabu';
    case 'Thu':
      return 'Kamis';
    case 'Fri':
      return "Jum'at";
    case 'Sat':
      return 'Sabtu';
    case 'Sun':
      return 'Minggu';
    default:
      return 'Unknown day';
  }
}

final oCcy = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = oCcy;

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection(
          baseOffset: newText.length, extentOffset: newText.length),
    );
  }
}
