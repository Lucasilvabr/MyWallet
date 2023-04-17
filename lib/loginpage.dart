import 'package:flutter/material.dart';
import 'package:flutter_application_1/secondpage.dart';
import 'package:flutter_application_1/forgotpassword.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/sobrepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonWidth = screenSize.width * 0.8;
    final buttonHeight = screenSize.height * 0.07;

    return Scaffold(
      body: Container(

        width: screenSize.width,
        height: screenSize.height,
        color: const Color.fromRGBO(243, 243, 244, 1),
        padding: const EdgeInsets.all(16),
        
        child: SingleChildScrollView(
          
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            <Widget>[
              SizedBox(
                height: screenSize.height * 0.15,
                child: Image.asset('../images/crypto-wallet.png'),
              ),
              const SizedBox(height: 30),
              Container(
                child: const Text('MY WALLET',
                    style: TextStyle(fontSize: 30, color: Colors.grey)),
                alignment: Alignment.center,
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: screenSize.width * 0.8,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: screenSize.width * 0.8,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => menu(),
                      ),
                    );
                  },
                  child: const Text('Login',
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
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => secondpage()),
                  );
                },
                child: const Text(
                  'Crie uma conta',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    color: Colors.blue,
                    ),
                  ),
              ),
              GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => forgotpasswordPage()),
    );
  },
  child: const Text(
    'Esqueceu a sua senha?',
    style: TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 16,
      color: Colors.blue,
    ),
  ),
),
SizedBox(height: 100),
              GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => sobrepage()),
    );
  },
  child: const Text(
    'sobre',
    style: TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 16,
      color: Colors.blue,
    ),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}