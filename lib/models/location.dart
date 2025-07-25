class Location {
  final String? type;
  final String? id;
  final double? latitude;
  final double? longitude;

  Location({
    this.type,
    this.id,
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Location();

    return Location(
      type: json['type'] as String?,
      id: json['id'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }
}