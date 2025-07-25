class Operator {
  final String? type;
  final String? id;
  final String? name;

  Operator({
    this.type,
    this.id,
    this.name,
  });

  factory Operator.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Operator();

    return Operator(
      type: json['type'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }
}