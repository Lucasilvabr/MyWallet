import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginpage.dart';

class deposito extends StatefulWidget {
  @override
  _depositoState createState() => _depositoState();
}

class _depositoState extends State<deposito> {
  List<double> lancamentos = [];
  double saldo = 0.0;
  final valorController = TextEditingController();

  void _adicionarLancamento(double valor) {
    setState(() {
      lancamentos.add(valor);
      saldo += valor;
    });
  }

  @override
  void dispose() {
    valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depósito'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // alinhamento centralizado
          children: [
            Text(
              'Faça um depósito:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Valor',
              ),
              onFieldSubmitted: (String value) {
                double valor = double.tryParse(value) ?? 0;
                if (valor > 0) {
                  _adicionarLancamento(valor);
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Depósito'),
                      content: Text('Você depositou R\$ $valor.'),
                      actions: [
                        TextButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 16),
            Text(
              'Lançamentos:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lancamentos.length,
                itemBuilder: (context, index) {
                  double valor = lancamentos[index];
                  return Text(
                    'R\$ $valor',
                    style: TextStyle(fontSize: 16),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Center( // caixa de texto centralizada
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Saldo total: R\$ $saldo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
