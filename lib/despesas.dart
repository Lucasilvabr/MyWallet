import 'package:flutter/material.dart';

class ExpenseListPage extends StatefulWidget {
  @override
  _ExpenseListPageState createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  final _nameController = TextEditingController();
  final _valueController = TextEditingController();
  final _expensesList = <Expense>[];

  void _addExpense() {
    final name = _nameController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    setState(() {
      _expensesList.add(Expense(name: name, value: value));
    });

    _nameController.clear();
    _valueController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Despesas'),
    );

    final buttonWidth = MediaQuery.of(context).size.width * 0.7;
    final buttonHeight = 70.0;

    final addButton = ElevatedButton(
      onPressed: _addExpense,
      child: const Text('Adicionar',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: Colors.white)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(41, 182, 246, 100)),
        fixedSize:
            MaterialStateProperty.all<Size>(Size(buttonWidth, buttonHeight)),
      ),
    );

    final expenseForm = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
              labelText: 'Nome',
              labelStyle: TextStyle(fontSize: 20, color: Colors.black54)),
          style: const TextStyle(fontSize: 20),
        ),
        TextField(
          controller: _valueController,
          decoration: const InputDecoration(
              labelText: 'Valor (R\$)',
              labelStyle: TextStyle(fontSize: 20, color: Colors.black54)),
          style: const TextStyle(fontSize: 20),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 20),
        addButton,
      ],
    );

    final expensesList = Expanded(
      child: ListView.builder(
        itemCount: _expensesList.length,
        itemBuilder: (context, index) {
          final expense = _expensesList[index];
          return ListTile(
            title: Text(expense.name),
            subtitle: Text('R\$ ${expense.value.toStringAsFixed(2)}'),
          );
        },
      ),
    );

    final total = _expensesList.fold(
        0.0, (previousValue, element) => previousValue + element.value);

    final totalText = Text(
      'Total: R\$ ${total.toStringAsFixed(2)}',
      style: const TextStyle(fontSize: 20),
    );

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            expenseForm,
            const SizedBox(height: 30),
            expensesList,
            const SizedBox(height: 20),
            totalText,
          ],
        ),
      ),
    );
  }
}

class Expense {
  final String name;
  final double value;

  Expense({required this.name, required this.value});
}
