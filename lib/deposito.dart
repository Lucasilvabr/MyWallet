import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginpage.dart';

class DepositoPage extends StatefulWidget {
  @override
  _DepositoPageState createState() => _DepositoPageState();
}

class _DepositoPageState extends State<DepositoPage> {
  List<double> lancamentos = [];

  void _adicionarLancamento(double valor) {
    setState(() {
      lancamentos.add(valor);
    });
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Valor',
              ),
              onFieldSubmitted: (String value) {
                double valor = double.tryParse(value) ?? 0;
                _adicionarLancamento(valor);
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
          ],
        ),
      ),
    );
  }
}
