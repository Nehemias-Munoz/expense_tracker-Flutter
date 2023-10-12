import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ExpenseModel {
  String id;
  String title;
  double amount;
  DateTime date;

  ExpenseModel({required this.title, required this.amount, required this.date})
      : id = uuid.v1();
}
