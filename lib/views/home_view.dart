import 'package:expense_tracker/views/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: Center()),
          Expanded(
            flex: 4,
            child: ExpensesList(),
          ),
        ],
      ),
    );
  }
}
