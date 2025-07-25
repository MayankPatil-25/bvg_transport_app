import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bvg_transport_app/models/api_models/departure_response.dart';
import 'package:bvg_transport_app/models/departures.dart';
import 'package:bvg_transport_app/models/stop.dart';

class BVGService {
  static const String _baseUrl = "https://v6.bvg.transport.rest";
  static const Duration _timeoutDuration = Duration(seconds: 15);

  final http.Client _client;

  BVGService({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<Stop>> searchStopAsync(String query) async {
    try {
      final uri = Uri.parse('$_baseUrl/locations').replace(
        queryParameters: {
          'poi': 'false',
          'addresses': 'false',
          'query': query,
        },
      );

      final response = await _client.get(uri).timeout(_timeoutDuration);

      return _handleResponse<List<Stop>>(
        response,
        parse: (data) => (data as List).map((e) => Stop.fromJson(e)).toList(),
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<Departure>> fetchDepartures(String stopId) async {
    try {
      final uri = Uri.parse('$_baseUrl/stops/$stopId/departures').replace(
        queryParameters: {'results': '5'},
      );

      final response = await _client.get(uri).timeout(_timeoutDuration);

      return _handleResponse<DeparturesResponse>(
        response,
        parse: (data) => DeparturesResponse.fromJson(data),
      ).departures ?? [];
    } catch (e) {
      throw _handleError(e);
    }
  }

  T _handleResponse<T>(http.Response response, {required T Function(dynamic) parse}) {
    if (response.statusCode == 200) {
      return parse(jsonDecode(response.body));
    } else {
      throw ApiException(
        'Request failed with status: ${response.statusCode}',
        response.statusCode,
      );
    }
  }

  Exception _handleError(dynamic error) {
    if (error is TimeoutException) {
      return ApiException('Request timed out', 408);
    } else if (error is ApiException) {
      return error;
    }
    return ApiException('Network error: ${error.toString()}');
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => 'ApiException: $message${statusCode != null ? ' ($statusCode)' : ''}';
}