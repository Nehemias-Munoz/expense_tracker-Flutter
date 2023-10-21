import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
      {super.key,
      required this.title,
      required this.date,
      required this.amount,
      required this.id});

  final String id;
  final String title;
  final String date;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: ListTile(
              title: Text(title),
              trailing: Text('$amount\$'),
              subtitle: Text(date),
            ),
          ),
        ],
      ),
    );
  }
}
