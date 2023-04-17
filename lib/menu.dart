import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Depositar',
                style: TextStyle(fontSize: 50),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Cartões',
                style: TextStyle(fontSize: 50),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Despesas',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
