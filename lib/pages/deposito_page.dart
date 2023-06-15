import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/deposito_controller.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:uuid/uuid.dart';

import '../models/deposito.dart';
import '../utils/format_currency.dart';

class DepositoPage extends StatefulWidget {
  const DepositoPage({super.key});

  @override
  _DepositoPageState createState() => _DepositoPageState();
}

class _DepositoPageState extends State<DepositoPage> {
  final valorController = TextEditingController();
  final valorEditController = TextEditingController();

  void _adicionarLancamento() {
    setState(() {
      if (valorController.text.isNotEmpty) {
        var uuid = const Uuid();
        Deposito deposito = Deposito(int.parse(valorController.text), uuid.v4(),
            LoginController().getUserId());

        DepositoController().createDeposito(context, deposito);
      }
    });
  }

  void delete(id) {
    setState(() {
      DepositoController().deleteDeposito(context, id);
    });
  }

  Future<void> _showEditDialog(Deposito deposito) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text('Edite seu depósito',
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
                            const Text(
                              'Valor:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: valorEditController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Valor',
                                border: OutlineInputBorder(),
                              ),
                            ),
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
                    if (valorEditController.text.isNotEmpty) {
                      Deposito novoDeposito = Deposito(
                          int.parse(valorEditController.text),
                          deposito.uid,
                          deposito.userId);
                      DepositoController()
                          .updateDeposito(context, novoDeposito);
                    }
                  });
                  valorEditController.clear();
                },
                child: const Text('Editar depósito'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Poupança',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          // alinhamento centralizado
          children: [
            const Text(
              'Faça um depósito:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Valor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  _adicionarLancamento();
                },
                child: const Text('Depositar'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Deposito>>(
                future: DepositoController().listDepositos(context),
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
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
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
                                title: FutureBuilder<String>(
                                    future: LoginController().loggedUser(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Text('${snapshot.data}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16));
                                      }

                                      return const Text(
                                        'Cálculo inválido',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      );
                                    }),
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
                  future: DepositoController().getSaldoTotal(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Valor guardado: ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text('${snapshot.data}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.green))
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
