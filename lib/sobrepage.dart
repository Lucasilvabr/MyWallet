import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY WALLET'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MY WALLET é um gerenciador financeiro.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Foi desenvolvido para auxiliar o usuário em sua organização financeira. Através dele você terá acesso a várias contas ao mesmo tempo, podendo analisá-las de forma rápida, podendo ter um controle financeiro mais efetivo.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Funcionalidades:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '- Gerenciamento de:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- contas.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- cartões.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- despesas.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
