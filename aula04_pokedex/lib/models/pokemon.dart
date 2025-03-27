class Pokemon {
  String numero;
  String nome;
  String imagem;

  Pokemon({
    required this.numero,
    required this.nome,
    this.imagem = ''
  });

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      numero: map['num'],
      nome: map['name'],
      imagem: map['img']
    );
  }
}