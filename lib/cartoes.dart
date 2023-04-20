import 'package:flutter/material.dart';

class cartoes extends StatefulWidget {
  @override
  _cartoesState createState() => _cartoesState();
}

class _cartoesState extends State<cartoes> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numeroController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _numeroController.dispose();
    _nomeController.dispose();
    _dataController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonWidth = screenSize.width * 0.8;
    final buttonHeight = screenSize.height * 0.07;

    return Scaffold(
      appBar: AppBar(
        title: Row(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                TextFormField(
                  controller: _numeroController,
                  decoration: InputDecoration(
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
                SizedBox(height: 30),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
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
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _dataController,
                        decoration: InputDecoration(
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
                    SizedBox(width: 30),
                    Expanded(
                      child: TextFormField(
                        controller: _cvvController,
                        decoration: InputDecoration(
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
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Adicionar cartão à lista de cartões
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(41, 182, 246, 100)),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(buttonWidth, buttonHeight)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0)))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
