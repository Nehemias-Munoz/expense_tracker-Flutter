import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMMMMEEEEd();

enum Category { viaje, otro, trabajo, sueldo }

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  Category category = Category.otro;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v1();

  String get formattedDate {
    return formatter.format(date);
  }
}
