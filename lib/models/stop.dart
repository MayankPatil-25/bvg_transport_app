import 'package:bvg_transport_app/models/location.dart';
import 'package:bvg_transport_app/models/products.dart';

class Stop {
  final String? type;
  final String? id;
  final String? name;
  final Location? location;
  final Products? products;

  Stop({
    this.type,
    this.id,
    this.name,
    this.location,
    this.products,
  });

  factory Stop.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Stop();

    return Stop(
      type: json['type'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      location: Location.fromJson(json['location']),
      products: Products.fromJson(json['products']),
    );
  }
}
