import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: ListTile(
                  title: Text("Gasto $index"),
                  trailing: Text(index.toString()),
                  subtitle: Text(DateFormat.yMMMMEEEEd()
                      .format(DateTime.now())
                      .toString()),
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
        ),
      ),
    );
  }
}
