import 'package:bvg_transport_app/models/operator.dart';

class Line {
  final String? type;
  final String? id;
  final String? fahrtNr;
  final String? name;
  final bool? public;
  final String? adminCode;
  final String? productName;
  final String? mode;
  final String? product;
  final Operator? operator;

  Line({
    this.type,
    this.id,
    this.fahrtNr,
    this.name,
    this.public,
    this.adminCode,
    this.productName,
    this.mode,
    this.product,
    this.operator,
  });

  factory Line.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Line();

    return Line(
      type: json['type'] as String?,
      id: json['id'] as String?,
      fahrtNr: json['fahrtNr'] as String?,
      name: json['name'] as String?,
      public: json['public'] as bool? ?? false,
      adminCode: json['adminCode'] as String?,
      productName: json['productName'] as String?,
      mode: json['mode'] as String?,
      product: json['product'] as String?,
      operator: Operator.fromJson(json['operator']),
    );
  }
}