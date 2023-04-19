import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/deposito.dart';
import 'package:flutter_application_1/cartoes.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonWidth = screenSize.width * 0.8;
    final buttonHeight = screenSize.height * 0.07;

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => deposito()),
                );
              },
              child: const Text('Depositar',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 50,
                          color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(41, 182, 246, 100)),
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size(buttonWidth, buttonHeight)),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cartoes()),
                );
              },
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '  Cartões ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 50,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(41, 182, 246, 100)),
                  fixedSize: MaterialStateProperty.all<Size>(
                      Size(buttonWidth, buttonHeight)),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Despesas',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 50,
                          color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(41, 182, 246, 100)),
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size(buttonWidth, buttonHeight)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
