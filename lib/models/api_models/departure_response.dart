import 'package:bvg_transport_app/models/departures.dart';

class DeparturesResponse {
  final List<Departure>? departures;
  final int? realtimeDataUpdatedAt;

  DeparturesResponse({
    this.departures,
    this.realtimeDataUpdatedAt,
  });

  factory DeparturesResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return DeparturesResponse();

    return DeparturesResponse(
      departures: (json['departures'] as List?)?.map((e) => Departure.fromJson(e)).toList() ?? [],
      realtimeDataUpdatedAt: json['realtimeDataUpdatedAt'] as int?,
    );
  }
}