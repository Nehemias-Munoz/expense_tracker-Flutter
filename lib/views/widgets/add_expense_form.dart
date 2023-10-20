import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({super.key, required this.onAddExpense});
  final void Function(ExpenseModel expense) onAddExpense;
  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime? _selectedDate;
  double _enteredAmount = 0.0;
  String _enteredTitle = '';

  @override
  void dispose() {
    _titleInputController.dispose();
    _amountInputController.dispose();
    super.dispose();
  }

  _presentDatePicker() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 5, now.month, now.day);
    final DateTime lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitForm() {
    if (_selectedDate == null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Invalid Date"),
          content: const Text("Please select a valid date"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Ok"),
            )
          ],
        ),
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      final newExpense = ExpenseModel(
          title: _enteredTitle,
          amount: _enteredAmount,
          date: _selectedDate!,
          category: Category.otro);
      widget.onAddExpense(newExpense);
    }
  }

  String? _amountValidator(String? value) {
    final enteredAmount = double.tryParse(value!);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (amountIsInvalid) {
      return "Please enter some valid number";
    }
    _enteredAmount = enteredAmount;
    return null;
  }

  String? _titleValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter some text";
    }
    _enteredTitle = value;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleInputController,
              validator: (String? value) => _titleValidator(value),
              decoration: const InputDecoration(
                label: Text("Title"),
                hintText: 'Buy clothes',
                border: OutlineInputBorder(),
              ),
              maxLength: 50,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _amountInputController,
                    validator: (String? value) => _amountValidator(value),
                    decoration: const InputDecoration(
                      label: Text("Amount"),
                      hintText: "490",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .07,
                ),
                ElevatedButton.icon(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_month_outlined),
                  label: Text(_selectedDate == null
                      ? "Selected Date"
                      : formatterSimple.format(_selectedDate!)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                SizedBox(width: MediaQuery.sizeOf(context).width * .07),
                ElevatedButton(
                    onPressed: _submitForm, child: const Text("Save"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
