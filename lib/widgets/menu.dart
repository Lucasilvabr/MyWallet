import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/deposito_page.dart';
import 'package:flutter_application_1/pages/cartoes_page.dart';
import 'package:flutter_application_1/pages/despesas_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';

import '../controllers/login_controller.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController nameController = TextEditingController();

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Alterar meu nome',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              )
            ],
          ),
          content: Form(
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe seu nome.';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Digite seu novo nome...',
                            constraints: BoxConstraints(maxHeight: 40),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Salvar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              onPressed: () {
                String newName = nameController.text;
                setState(() {
                  LoginController().changeUsername(context, newName);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonWidth = screenSize.width * 0.8;
    final buttonHeight = screenSize.height * 0.07;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              height: 100.0,
            ),
            AppBar(
              title: Row(
                children: [
                  FutureBuilder<String>(
                    future: LoginController().loggedUser(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Row(
                          children: [
                            Container(
                              child: Row(children: [
                                const Text('Bem-vindo, ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                                Text(
                                  '${snapshot.data}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    _showDialog();
                                  },
                                ),
                              ]),
                            ),
                            IconButton(
                              icon: const Icon(Icons.logout_rounded,
                                  color: Colors.black),
                              onPressed: () {
                                LoginController().logout();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                            ),
                          ],
                        );
                      }

                      return const Text(
                        'Bem-vindo, usuário',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DepositoPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(243, 147, 4, 0.973),
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(buttonWidth, buttonHeight),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/deposito.png'),
                  const SizedBox(width: 10),
                  const Text(
                    'POUPANÇA',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartoesPage()),
                );
              },
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartoesPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(41, 182, 246, 100),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(buttonWidth, buttonHeight),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('images/cartoes.png'),
                    const SizedBox(width: 10),
                    const Text(
                      'CARTÕES',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpenseListPage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(156, 212, 41, 246),
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(buttonWidth, buttonHeight),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/despesas.png'),
                  const SizedBox(width: 10),
                  const Text(
                    'DESPESAS',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
