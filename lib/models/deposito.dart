class Deposito {
  final int valor;
  final String uid;
  final String userId;

  Deposito(this.valor, this.uid, this.userId);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'valor': valor,
      'uid': uid,
      'userId': userId,
    };
  }

  factory Deposito.fromJson(Map<String, dynamic> json) {
    return Deposito(json['valor'], json['uid'], json['userId']);
  }
}
