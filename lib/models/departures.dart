import 'package:bvg_transport_app/models/line.dart';
import 'package:bvg_transport_app/models/location.dart';
import 'package:bvg_transport_app/models/remark.dart';
import 'package:bvg_transport_app/models/stop.dart';
class Departure {
  final String? tripId;
  final Stop? stop;
  final DateTime? when;
  final DateTime? plannedWhen;
  final int? delay;
  final String? platform;
  final String? plannedPlatform;
  final String? prognosisType;
  final String? direction;
  final Line? line;
  final List<Remark>? remarks;
  final Stop? origin;
  final Stop? destination;
  final Location? currentTripPosition;

  Departure({
    this.tripId,
    this.stop,
    this.when,
    this.plannedWhen,
    this.delay,
    this.platform,
    this.plannedPlatform,
    this.prognosisType,
    this.direction,
    this.line,
    this.remarks,
    this.origin,
    this.destination,
    this.currentTripPosition,
  });

  factory Departure.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Departure();

    return Departure(
      tripId: json['tripId'] as String?,
      stop: Stop.fromJson(json['stop']),
      when: json['when'] != null ? DateTime.tryParse(json['when']) : null,
      plannedWhen: json['plannedWhen'] != null ? DateTime.tryParse(json['plannedWhen']) : null,
      delay: json['delay'] as int? ?? 0,
      platform: json['platform'] as String? ?? 'N/A',
      plannedPlatform: json['plannedPlatform'] as String? ?? 'N/A',
      prognosisType: json['prognosisType'] as String? ?? 'unknown',
      direction: json['direction'] as String? ?? 'Unknown direction',
      line: Line.fromJson(json['line']),
      remarks: (json['remarks'] as List?)?.map((e) => Remark.fromJson(e)).toList() ?? [],
      origin: json['origin'] != null ? Stop.fromJson(json['origin']) : null,
      destination: Stop.fromJson(json['destination']),
      currentTripPosition: Location.fromJson(json['currentTripPosition']),
    );
  }
}
