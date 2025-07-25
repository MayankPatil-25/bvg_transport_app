class Remark {
  final String? type;
  final String? code;
  final String? text;

  Remark({
    this.type,
    this.code,
    this.text,
  });

  factory Remark.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Remark();

    return Remark(
      type: json['type'] as String?,
      code: json['code'] as String?,
      text: json['text'] as String?,
    );
  }
}