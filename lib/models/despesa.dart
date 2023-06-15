class Despesa {
  final String nome;
  final int valor;
  final String uid;
  final String userId;

  Despesa(this.nome, this.valor, this.uid, this.userId);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nome': nome,
      'valor': valor,
      'uid': uid,
      'userId': userId,
    };
  }

  factory Despesa.fromJson(Map<String, dynamic> json) {
    return Despesa(json['nome'], json['valor'], json['uid'], json['userId']);
  }
}
