import 'package:intl/intl.dart';

/// String Extensions
extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String capitalizeWords() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  bool isValidEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  bool isValidPhoneNumber() {
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    return phoneRegex.hasMatch(this);
  }
}

/// DateTime Extensions
extension DateTimeExtensions on DateTime {
  String toFormattedString() {
    return DateFormat('dd MMM yyyy, hh:mm a').format(this);
  }

  String toDateOnly() {
    return DateFormat('dd MMM yyyy').format(this);
  }

  String toTimeOnly() {
    return DateFormat('hh:mm a').format(this);
  }

  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}

/// Number Extensions
extension NumberExtensions on num {
  String toFormattedCurrency() {
    return '₹${toStringAsFixed(2)}';
  }
}
