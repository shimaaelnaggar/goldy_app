import 'package:goldy/core/models/metal_model.dart' show MetalModel;

class SilverModel implements MetalModel {
  @override
  final String name;
  @override
  final double price;
  @override
  final String symbol;
  @override
  final String updatedAtReadable;

  SilverModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAtReadable,
  });

  factory SilverModel.fromJson(Map<String, dynamic> json) {
    return SilverModel(
      name: json['name'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      symbol: json['symbol'] ?? '',
      updatedAtReadable: json['updatedAtReadable'] ?? '',
    );
  }
}
