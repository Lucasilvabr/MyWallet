import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/cartao.dart';
import '../utils/message.dart';
import 'login_controller.dart';

class CartaoController {
  createCartao(context, Cartao cartao) {
    FirebaseFirestore.instance
        .collection('cartoes')
        .doc(cartao.uid)
        .set(cartao.toJson())
        .then((value) {
      success(context, 'Cartão adicionado com sucesso!');
    }).catchError((e) {
      error(context, 'Erro na criação: ${e.code.toString()}');
    });
  }

  updateCartao(context, Cartao cartao) {
    FirebaseFirestore.instance
        .collection('cartoes')
        .doc(cartao.uid)
        .update(cartao.toJson())
        .then((value) {
      success(context, 'Cartão atualizado com sucesso!');

      Navigator.of(context).pop();
    }).catchError((e) {
      error(context, 'Erro na atualização: ${e.code.toString()}');
      Navigator.of(context).pop();
    });
  }

  void deleteCartao(context, id) async {
    await FirebaseFirestore.instance
        .collection('cartoes')
        .doc(id)
        .delete()
        .then((value) => success(context, 'Cartão excluído com sucesso!'))
        .catchError(
            (e) => error(context, 'Erro na deleção: ${e.code.toString()}'));
  }

  Future<List<Cartao>> listCartoes(context) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('cartoes')
          .where('userId', isEqualTo: LoginController().getUserId())
          .get();
      List<Cartao> cartoes = [];
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Cartao cartao = Cartao.fromJson(data);
        cartoes.add(cartao);
      }
      return cartoes;
    } catch (e) {
      error(context, 'Erro no retorno dos cartões, tente novamente.');
      return [];
    }
  }
}
