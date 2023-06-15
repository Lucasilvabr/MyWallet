import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/despesa.dart';

import '../utils/message.dart';
import 'login_controller.dart';

class DespesaController {
  createDespesa(context, Despesa despesa) {
    FirebaseFirestore.instance
        .collection('despesas')
        .doc(despesa.uid)
        .set(despesa.toJson())
        .then((value) {
      success(context, 'Despesa adicionada com sucesso!');
    }).catchError((e) {
      error(context, 'Erro na criação: ${e.code.toString()}');
    });
  }

  updateDespesa(context, Despesa despesa) {
    FirebaseFirestore.instance
        .collection('despesas')
        .doc(despesa.uid)
        .update(despesa.toJson())
        .then((value) {
      success(context, 'Despesa atualizada com sucesso!');

      Navigator.of(context).pop();
    }).catchError((e) {
      error(context, 'Erro na atualização: ${e.code.toString()}');
      Navigator.of(context).pop();
    });
  }

  void deleteDespesa(context, id) async {
    await FirebaseFirestore.instance
        .collection('despesas')
        .doc(id)
        .delete()
        .then((value) => success(context, 'Despesa excluída com sucesso!'))
        .catchError(
            (e) => error(context, 'Erro na deleção: ${e.code.toString()}'));
  }

  Future<String> getSaldoTotal(context) async {
    double saldo = 0;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('despesas')
          .where('userId', isEqualTo: LoginController().getUserId())
          .get();

      List<Despesa> despesas = [];

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Despesa despesa = Despesa.fromJson(data);
        despesas.add(despesa);
      }
      for (var depo in despesas) {
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

  Future<List<Despesa>> listDespesas(context) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('despesas')
          .where('userId', isEqualTo: LoginController().getUserId())
          .get();
      List<Despesa> despesas = [];
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Despesa despesa = Despesa.fromJson(data);
        despesas.add(despesa);
      }
      return despesas;
    } catch (e) {
      error(context, 'Erro no retorno das despesas, tente novamente.');
      return [];
    }
  }
}
