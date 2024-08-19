const List<String> _dayNames = [
  'Minggu',
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jumat',
  'Sabtu'
];

const List<String> _monthNames = [
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

extension DateTimeExt on DateTime {
  String toFormattedDate() {
    String dayName = _dayNames[weekday - 1];
    return '$dayName, ${toFormattedTime()}';
  }

  String toFormattedMonth() {
    return _monthNames[month - 1];
  }

  String toFormattedTime() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute WIB';
  }

  String toFormattedDateTime() {
    String day = this.day.toString();
    String month = _monthNames[this.month - 1];
    String year = this.year.toString();
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$day $month $year, $hour.$minute';
  }
}
