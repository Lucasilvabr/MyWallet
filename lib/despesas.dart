
import 'package:flutter/material.dart';

class Expense {
  String name;
  double value;

  Expense(this.name, this.value);
}

class ExpenseListPage extends StatelessWidget {
  final List<Expense> expenses = [
    Expense('Comida', 50),
    Expense('Transporte', 20),
    Expense('Lazer', 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (BuildContext context, int index) {
          Expense expense = expenses[index];
          return ListTile(
            title: Text(expense.name),
            trailing: Text('R\$ ${expense.value.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
