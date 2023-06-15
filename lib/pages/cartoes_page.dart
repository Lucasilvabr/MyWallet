import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cartao_controller.dart';
import 'package:flutter_application_1/models/cartao.dart';
import 'package:uuid/uuid.dart';

import '../controllers/login_controller.dart';

class CartoesPage extends StatefulWidget {
  const CartoesPage({super.key});

  @override
  _CartoesPageState createState() => _CartoesPageState();
}

class _CartoesPageState extends State<CartoesPage> {
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  final TextEditingController _numeroEditController = TextEditingController();
  final TextEditingController _nomeEditController = TextEditingController();
  final TextEditingController _dataEditController = TextEditingController();
  final TextEditingController _cvvEditController = TextEditingController();

  @override
  void dispose() {
    _numeroController.dispose();
    _nomeController.dispose();
    _dataController.dispose();
    _cvvController.dispose();

    super.dispose();
  }

  void delete(id) {
    setState(() {
      CartaoController().deleteCartao(context, id);
    });
  }

  void _adicionarCartao() {
    setState(() {
      if (_numeroController.text.isNotEmpty &&
          _nomeController.text.isNotEmpty &&
          _dataController.text.isNotEmpty &&
          _cvvController.text.isNotEmpty) {
        var uuid = const Uuid();
        Cartao deposito = Cartao(
            _numeroController.text,
            _nomeController.text,
            _dataController.text,
            int.parse(_cvvController.text),
            uuid.v4(),
            LoginController().getUserId());

        CartaoController().createCartao(context, deposito);

        _numeroController.clear();
        _nomeController.clear();
        _dataController.clear();
        _cvvController.clear();
      }
    });
  }

  Future<void> _showEditDialog(Cartao cartao) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Edite seu cartão',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade),
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
                            TextFormField(
                              controller: _numeroEditController,
                              decoration: const InputDecoration(
                                labelText: 'Número do cartão',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, informe o número do cartão';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _nomeEditController,
                              decoration: const InputDecoration(
                                labelText: 'Nome do titular',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, informe o nome do titular';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _dataEditController,
                              decoration: const InputDecoration(
                                labelText: 'Validade',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, informe a validade do cartão';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _cvvEditController,
                              decoration: const InputDecoration(
                                labelText: 'CVV',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, informe o CVV do cartão';
                                }
                                return null;
                              },
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
                    if (_numeroEditController.text.isNotEmpty &&
                        _nomeEditController.text.isNotEmpty &&
                        _dataEditController.text.isNotEmpty &&
                        _cvvEditController.text.isNotEmpty) {
                      Cartao novoCartao = Cartao(
                          _numeroEditController.text,
                          _nomeEditController.text,
                          _dataEditController.text,
                          int.parse(_cvvEditController.text),
                          cartao.uid,
                          LoginController().getUserId());
                      CartaoController().updateCartao(context, novoCartao);
                      _numeroEditController.clear();
                      _nomeEditController.clear();
                      _dataEditController.clear();
                      _cvvEditController.clear();
                    }
                  });
                },
                child: const Text('Editar cartão'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Adicionar Cartão',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              TextFormField(
                controller: _numeroController,
                decoration: const InputDecoration(
                  labelText: 'Número do cartão',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o número do cartão';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do titular',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o nome do titular';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dataController,
                      decoration: const InputDecoration(
                        labelText: 'Validade',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, informe a validade do cartão';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: TextFormField(
                      controller: _cvvController,
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, informe o CVV do cartão';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      _adicionarCartao();
                    },
                    child:
                        const Text('Adicionar', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<List<Cartao>>(
                  future: CartaoController().listCartoes(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none ||
                        snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          'Você ainda não possui cartões.',
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
                                          onPressed: () => {
                                                delete(
                                                    snapshot.data![index].uid),
                                              }),
                                    ],
                                  ),
                                  leading: const Icon(Icons.credit_card,
                                      color: Colors.amber, size: 30),
                                  title: Text(snapshot.data![index].nomeTitular,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.data![index].numero,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        snapshot.data![index].validade,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
