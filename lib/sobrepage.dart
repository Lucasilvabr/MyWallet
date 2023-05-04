import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class sobrepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'MY WALLET',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Expanded(
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
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Desenvolvido por Lucas Silva',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('../images/perfil.jpg'),
                          ),
                        ),
                      ),
                    ],
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
