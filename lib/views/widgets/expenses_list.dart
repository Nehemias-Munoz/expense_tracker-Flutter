import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/views/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});
  final List<ExpenseModel> expenses;
  final Function(ExpenseModel expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, i) => Dismissible(
          key: Key(expenses[i].id),
          onDismissed: (direction) => removeExpense(expenses[i]),
          child: ExpenseItem(
            id: expenses[i].id,
            title: expenses[i].title,
            amount: expenses[i].amount,
            date: expenses[i].formattedDate,
          ),
        ),
      ),
    );
  }
}
