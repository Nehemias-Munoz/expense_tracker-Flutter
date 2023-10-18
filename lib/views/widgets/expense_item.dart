import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
      {super.key,
      required this.title,
      required this.date,
      required this.amount});

  final String title;
  final String date;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: ListTile(
              title: Text(title),
              trailing: Text('$amount\$'),
              subtitle: Text(date),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                      title: Text("Seguro desea eliminar?"),
                      actions: [Text("Cancelar"), Text("Eliminar")]),
                );
              },
              icon: const Icon(Icons.delete_forever_outlined),
            ),
          )
        ],
      ),
    );
  }
}
