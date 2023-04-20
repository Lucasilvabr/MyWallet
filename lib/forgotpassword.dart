import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/secondpage.dart';

class forgotpasswordPage extends StatefulWidget {
  @override
  _forgotpasswordPageState createState() => _forgotpasswordPageState();
}

class _forgotpasswordPageState extends State<forgotpasswordPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Esqueci minha senha',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // implementar recuperação de senha
                // exibir mensagem
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Uma nova senha foi enviada para seu e-mail.'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50), // definir o tamanho mínimo do botão
                textStyle:
                    TextStyle(color: Colors.white), // definir a cor do texto
              ),
              child: Text(
                'Recuperar senha',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
