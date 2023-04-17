import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginpage.dart';

class secondpage extends StatefulWidget {
  @override
  _secondpageState createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
 


  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
    final buttonWidth = screenSize.width * 0.8;
    final buttonHeight = screenSize.height * 0.07;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
  height: 32.0,
),
SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: const Text('Cadasstrar',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(const Color.fromRGBO(41, 182, 246, 100)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
