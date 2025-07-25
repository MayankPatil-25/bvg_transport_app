class Products {
  final bool? suburban;
  final bool? subway;
  final bool? tram;
  final bool? bus;
  final bool? ferry;
  final bool? express;
  final bool? regional;

  Products({
    this.suburban,
    this.subway,
    this.tram,
    this.bus,
    this.ferry,
    this.express,
    this.regional,
  });

  factory Products.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Products();

    return Products(
      suburban: json['suburban'] as bool? ?? false,
      subway: json['subway'] as bool? ?? false,
      tram: json['tram'] as bool? ?? false,
      bus: json['bus'] as bool? ?? false,
      ferry: json['ferry'] as bool? ?? false,
      express: json['express'] as bool? ?? false,
      regional: json['regional'] as bool? ?? false,
    );
  }
}