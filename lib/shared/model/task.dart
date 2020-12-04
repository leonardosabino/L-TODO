class Task {
  int id;
  String titulo;
  String descricao;

  Task({this.id, this.titulo, this.descricao});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $titulo, age: $descricao}';
  }
}
