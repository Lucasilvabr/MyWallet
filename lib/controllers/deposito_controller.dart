import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/deposito.dart';

import '../utils/message.dart';
import 'login_controller.dart';

class DepositoController {
  createDeposito(context, Deposito deposito) {
    FirebaseFirestore.instance
        .collection('depositos')
        .doc(deposito.uid)
        .set(deposito.toJson())
        .then((value) {
      success(context, 'Depósito adicionado com sucesso!');
    }).catchError((e) {
      error(context, 'Erro na criação: ${e.code.toString()}');
    });
  }

  updateDeposito(context, Deposito deposito) {
    FirebaseFirestore.instance
        .collection('depositos')
        .doc(deposito.uid)
        .update(deposito.toJson())
        .then((value) {
      success(context, 'Depósito atualizado com sucesso!');

      Navigator.of(context).pop();
    }).catchError((e) {
      error(context, 'Erro na atualização: ${e.code.toString()}');
      Navigator.of(context).pop();
    });
  }

  void deleteDeposito(context, id) async {
    await FirebaseFirestore.instance
        .collection('depositos')
        .doc(id)
        .delete()
        .then((value) => success(context, 'Depósito excluído com sucesso!'))
        .catchError(
            (e) => error(context, 'Erro na deleção: ${e.code.toString()}'));
  }

  Future<double> getSaldo() async {
    late double saldo;
    await FirebaseFirestore.instance
        .collection('depositos')
        .where('uid', isEqualTo: LoginController().getUserId())
        .get()
        .then(
      (result) {
        saldo = result.docs[0].data()['nome'] ?? '';
      },
    );
    return saldo;
  }

  Future<String> getSaldoTotal(context) async {
    double saldo = 0;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('depositos')
          .where('userId', isEqualTo: LoginController().getUserId())
          .get();

      List<Deposito> depositos = [];

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Deposito deposito = Deposito.fromJson(data);
        depositos.add(deposito);
      }
      for (var depo in depositos) {
        saldo += depo.valor;
      }

      String saldoString = saldo.toStringAsFixed(2);
      saldoString = saldoString.replaceAll('.', ',');
      return 'R\$ $saldoString';
    } catch (e) {
      error(context, 'Erro no retorno do saldo, tente novamente.');
      return '';
    }
  }

  Future<List<Deposito>> listDepositos(context) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('depositos')
          .where('userId', isEqualTo: LoginController().getUserId())
          .get();
      List<Deposito> depositos = [];
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Deposito deposito = Deposito.fromJson(data);
        depositos.add(deposito);
      }
      return depositos;
    } catch (e) {
      error(context, 'Erro no retorno do depósito, tente novamente.');
      return [];
    }
  }
}
