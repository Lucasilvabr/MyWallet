import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/despesa_controller.dart';
import 'package:flutter_application_1/models/despesa.dart';
import 'package:uuid/uuid.dart';

import '../controllers/login_controller.dart';
import '../utils/format_currency.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({super.key});

  @override
  _ExpenseListPageState createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  final _nameController = TextEditingController();
  final _valueController = TextEditingController();
  final nomeEditController = TextEditingController();
  final valorEditController = TextEditingController();

  void _addExpense() {
    final name = _nameController.text;

    setState(() {
      if (_nameController.text.isNotEmpty && _valueController.text.isNotEmpty) {
        var uuid = const Uuid();
        Despesa despesa = Despesa(name, int.parse(_valueController.text),
            uuid.v4(), LoginController().getUserId());

        DespesaController().createDespesa(context, despesa);
      }
    });

    _nameController.clear();
    _valueController.clear();
  }

  void delete(id) {
    setState(() {
      DespesaController().deleteDespesa(context, id);
    });
  }

  Future<void> _showEditDialog(Despesa despesa) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text('Edite sua despesa',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
          content: Form(
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: nomeEditController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome',
                                  labelStyle: TextStyle(
                                      fontSize: 20, color: Colors.black54)),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: valorEditController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Valor (R\$)',
                                  labelStyle: TextStyle(
                                      fontSize: 20, color: Colors.black54)),
                              style: const TextStyle(fontSize: 20),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (nomeEditController.text.isNotEmpty &&
                        valorEditController.text.isNotEmpty) {
                      Despesa novaDespesa = Despesa(
                          nomeEditController.text,
                          int.parse(valorEditController.text),
                          despesa.uid,
                          LoginController().getUserId());
                      DespesaController().updateDespesa(context, novaDespesa);
                    }
                  });
                  valorEditController.clear();
                },
                child: const Text('Editar despesa'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        'Despesas',
        style: TextStyle(
          color: Colors.white, // Define a cor do texto para branco
        ),
      ),
    );

    final addButton = Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
          onPressed: () {
            _addExpense();
          },
          child: const Text('Adicionar', style: TextStyle(fontSize: 20)),
        ),
      ),
    );

    final expenseForm = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome',
              labelStyle: TextStyle(fontSize: 20, color: Colors.black54)),
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _valueController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Valor (R\$)',
              labelStyle: TextStyle(fontSize: 20, color: Colors.black54)),
          style: const TextStyle(fontSize: 20),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 20),
        addButton,
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            expenseForm,
            const SizedBox(height: 30),
            FutureBuilder<List<Despesa>>(
                future: DespesaController().listDespesas(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.none ||
                      snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'Você ainda não possui depósitos.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 8,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              borderOnForeground: true,
                              elevation: 8,
                              child: ListTile(
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.edit_outlined,
                                            color: Colors.black),
                                        onPressed: () {
                                          _showEditDialog(
                                              snapshot.data![index]);
                                        }),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      icon: const Icon(Icons.delete_forever,
                                          color: Colors.red),
                                      onPressed: () =>
                                          delete(snapshot.data![index].uid),
                                    ),
                                  ],
                                ),
                                title: Text(snapshot.data![index].nome,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                subtitle: Text(
                                  formatCurrency(snapshot.data![index].valor),
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
            const SizedBox(height: 16),
            Center(
              // caixa de texto centralizada
              child: FutureBuilder<String>(
                  future: DespesaController().getSaldoTotal(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Valor das despesas: ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text('${snapshot.data}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.red))
                          ],
                        ),
                      );
                    }

                    return const Text(
                      'Valor guardado:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
