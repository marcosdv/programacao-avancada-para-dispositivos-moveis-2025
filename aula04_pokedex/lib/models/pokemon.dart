class Pokemon {
  int codigo;
  String numero;
  String nome;

  Pokemon({
    required this.codigo,
    required this.numero,
    required this.nome
  });

  String getImagem() {
    return 'https://raw.githubusercontent.com/wellrccity/'
           'pokedex-html-js/refs/heads/master/assets/img/'
           'pokemons/poke_$codigo.gif';
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      codigo: map['id'],
      numero: map['num'],
      nome: map['name']
    );
  }
}