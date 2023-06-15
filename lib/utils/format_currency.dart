formatCurrency(int valor) {
  String saldoString = valor.toStringAsFixed(2);
  saldoString = saldoString.replaceAll('.', ',');
  return 'R\$ $saldoString';
}
