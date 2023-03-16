class Cases {
  final int id;
  final String name;
  final String description;
  final DateTime expiration;
  final DateTime acquisition;
  final DateTime consumption;

  Cases({
    required this.id,
    required this.name,
    required this.description,
    required this.expiration,
    required this.acquisition,
    required this.consumption,
  });

  factory Cases.fromJson(Map<String, dynamic> json) {
    return Cases(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      expiration: DateTime.parse(json['expiration']),
      acquisition: DateTime.parse(json['acquisition']),
      consumption: DateTime.parse(json['consumption']),
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, name: $name, description: $description}';
  }
}
