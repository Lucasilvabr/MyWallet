class Cartao {
  final String numero;
  final String nomeTitular;
  final String validade;
  final int cvv;
  final String uid;
  final String userId;

  Cartao(this.numero, this.nomeTitular, this.validade, this.cvv, this.uid,
      this.userId);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'numero': numero,
      'nomeTitular': nomeTitular,
      'validade': validade,
      'cvv': cvv,
      'uid': uid,
      'userId': userId,
    };
  }

  factory Cartao.fromJson(Map<String, dynamic> json) {
    return Cartao(json['numero'], json['nomeTitular'], json['validade'],
        json['cvv'], json['uid'], json['userId']);
  }
}
