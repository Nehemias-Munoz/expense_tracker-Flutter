import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/views/widgets/add_expense_form.dart';
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

    void _showAddExpenseForm() {
      showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        enableDrag: true,
        context: context,
        builder: (_) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddExpenseForm(),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        centerTitle: true,
        title: const Text("Expense tracker"),
        actions: [
          IconButton(
            onPressed: _showAddExpenseForm,
            icon: const Icon(Icons.add),
            tooltip: "Add new expense",
          )
        ],
      ),
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
