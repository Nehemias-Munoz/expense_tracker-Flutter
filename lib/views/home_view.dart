import 'dart:math';

import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/views/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ExpenseModel> expenses = [
      ExpenseModel(
          title: "Gasto",
          amount: 19.0,
          date: DateTime.now(),
          category: Category.otro),
      ExpenseModel(
          title: "Pago",
          amount: 23.0,
          date: DateTime.now(),
          category: Category.sueldo),
      ExpenseModel(
          title: "Recorrido casa",
          amount: 9.0,
          date: DateTime.now(),
          category: Category.viaje),
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: Center()),
          Expanded(
            flex: 4,
            child: ExpensesList(
              expenses: expenses,
            ),
          ),
        ],
      ),
    );
  }
}
